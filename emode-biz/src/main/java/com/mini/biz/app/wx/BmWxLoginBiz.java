package com.mini.biz.app.wx;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.WxConstant;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.http.HttpClientUtil;
import com.mini.pojo.model.dto.wx.BmWxCode2SessionDTO;
import com.mini.pojo.model.request.wx.BmWxJsCodeRequest;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import static com.mini.common.constant.WxConstant.WX_APPID;
import static com.mini.common.constant.WxConstant.WX_SECRET;

/**
 * @author zhl
 * @create 2025/2/26 16:08
 */
@Data
@Slf4j
@RequiredArgsConstructor
public class BmWxLoginBiz {

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

}
