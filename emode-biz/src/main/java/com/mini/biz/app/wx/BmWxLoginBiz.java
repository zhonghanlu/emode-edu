package com.mini.biz.app.wx;

import cn.dev33.satoken.stp.StpUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mini.app.service.BmUserPatriarchService;
import com.mini.app.service.BmWxPatriarchService;
import com.mini.app.service.BmWxService;
import com.mini.auth.model.dto.AuthUserDTO;
import com.mini.auth.service.IAuthUserService;
import com.mini.base.model.dto.SysLoginOptDTO;
import com.mini.base.service.ISysLoginOptService;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.LoginConstant;
import com.mini.common.constant.WxConstant;
import com.mini.common.enums.str.*;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.model.LoginModel;
import com.mini.common.model.LoginUser;
import com.mini.common.utils.LoginUtils;
import com.mini.common.utils.SmHutoolUtil;
import com.mini.common.utils.http.HttpClientUtil;
import com.mini.common.utils.http.ServletUtil;
import com.mini.manager.service.BmPatriarchService;
import com.mini.pojo.mapper.app.wx.BmWxStructMapper;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.dto.wx.BmWxCode2SessionDTO;
import com.mini.pojo.model.dto.wx.BmWxDTO;
import com.mini.pojo.model.request.wx.BmWxJsCodeRequest;
import com.mini.pojo.model.request.wx.BmWxLoginRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import static com.mini.common.constant.WxConstant.WX_APPID;
import static com.mini.common.constant.WxConstant.WX_SECRET;

/**
 * @author zhl
 * @create 2025/2/26 16:08
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmWxLoginBiz {

    private final BmWxService bmWxService;

    private final IAuthUserService authUserService;

    private final BmPatriarchService bmPatriarchService;

    private final BmUserPatriarchService bmUserPatriarchService;

    private final BmWxPatriarchService bmWxPatriarchService;

    private final ISysLoginOptService asyncLoginOptService;


    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 微信登录前置 jsCode2Session
     */
    public BmWxCode2SessionDTO jsCode2Session(BmWxJsCodeRequest request) {
        // 调用微信认证接口，获取 session_key 和 openid 等信息
        Map<String, String> dataMap = new HashMap<>();
        dataMap.put(WxConstant.PARAMS_APP_ID, WX_APPID);
        dataMap.put(WxConstant.PARAMS_SECRET, WX_SECRET);
        dataMap.put(WxConstant.PARAMS_JS_CODE, request.getJsCode());
        dataMap.put(WxConstant.PARAMS_GRANT_TYPE, WxConstant.VALUE_GRANT_TYPE);

        String res = HttpClientUtil.doGet(WxConstant.WX_JS_CODE_URL, dataMap);

        BmWxCode2SessionDTO bmWxCode2SessionDTO = null;

        try {
            bmWxCode2SessionDTO = objectMapper.readValue(res, BmWxCode2SessionDTO.class);
        } catch (JsonProcessingException e) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "获取用户信息失败");
        }

        // 发生错误才会有值
        if (Objects.nonNull(bmWxCode2SessionDTO) && StringUtils.isNotBlank(bmWxCode2SessionDTO.getErrcode())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR,
                    "获取用户信息失败，errCode：" + bmWxCode2SessionDTO.getErrcode() + " errMsg：" + bmWxCode2SessionDTO.getErrmsg());
        }

        return bmWxCode2SessionDTO;
    }

    /**
     * 微信登录
     */
    @Transactional(rollbackFor = Exception.class)
    public LoginModel login(BmWxLoginRequest request) {
        // 1.根据手机号查询微信用户数据
        BmWxDTO wxAccount = bmWxService.selectByPhoneNumber(request.getPhoneNumber());
        // 2.如果存在，进行登录操作
        if (Objects.nonNull(wxAccount)) {
            Long phoneNumber = wxAccount.getPhoneNumber();
            AuthUserDTO authUserDTO = authUserService.getUserByUsernameAndUserType(phoneNumber.toString(), UserType.MINI);
            if (Objects.isNull(authUserDTO)) {
                throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前微信用户数据异常，禁止登录");
            }
            // 执行登录
            return getLoginModel(authUserDTO);
        }

        // 3.如果不存在，进行注册操作
        BmWxDTO bmWxDTO = BmWxStructMapper.INSTANCE.req2Dto(request);
        // 3.1.新增微信用户数据
        bmWxDTO = bmWxService.insert(bmWxDTO);

        // 3.2.新增家长数据与用户数据关联
        BmPatriarchDTO bmPatriarchDTO = bmPatriarchService.add(BmWxStructMapper.INSTANCE.patriarchReq2Dto(request));
        AuthUserDTO userDTO = authUserService.insert(buildAuthUserDTO(request));
        bmUserPatriarchService.add(bmPatriarchDTO.getId(), userDTO.getId());

        // 3.3.新增微信用户与家长信息关联
        bmWxPatriarchService.add(bmPatriarchDTO.getId(), bmWxDTO.getId());

        // 3.4.登录
        return getLoginModel(userDTO);
    }

    /**
     * 执行登录 构建登录日志
     */
    private LoginModel getLoginModel(AuthUserDTO userDTO) {
        LoginUser loginUser = new LoginUser();
        loginUser.setUserId(userDTO.getId());
        loginUser.setUsername(userDTO.getUsername());
        loginUser.setUserType(UserType.MINI);
        LoginUtils.loginByDevice(loginUser, UserType.MINI, Device.MINI_APP);
        // 构建登录日志
        buildOptLoginLog(userDTO);
        return LoginModel.builder().token(StpUtil.getTokenValue()).build();
    }

    /**
     * 构建用户新增数据
     */
    private AuthUserDTO buildAuthUserDTO(BmWxLoginRequest request) {
        String phone = String.valueOf(request.getPhoneNumber());
        AuthUserDTO authUserDTO = new AuthUserDTO();
        authUserDTO.setUsername(phone);
        // 默认为自己的手机号
        authUserDTO.setPassword(SmHutoolUtil.sm2EncryptBase64(phone));
        authUserDTO.setNickname(request.getWxName());
        authUserDTO.setSex(Gender.UNKNOWN);
        authUserDTO.setAvatarId(request.getAvatarId());
        authUserDTO.setAvatarUrl(request.getAvatarUrl());
        authUserDTO.setPhone(phone);
        authUserDTO.setUserType(UserType.MINI);
        return authUserDTO;
    }

    /**
     * 构建登录日志
     */
    private void buildOptLoginLog(AuthUserDTO authUserDTO) {
        SysLoginOptDTO dto = SysLoginOptDTO.builder().username(authUserDTO.getUsername())
                .request(ServletUtil.getRequest())
                .optType(LoginOptType.LOGIN)
                .status(YesOrNo.YES)
                .optMsg(LoginConstant.MINI_LOGIN_SUCCESS)
                .build();
        asyncLoginOptService.addLoginOptInfo(dto);
    }
}
