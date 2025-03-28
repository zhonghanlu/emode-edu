package com.mini.biz.auth;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.auth.mapperstruct.AuthPermissionStructMapper;
import com.mini.auth.mapperstruct.AuthUserRoleStructMapper;
import com.mini.auth.mapperstruct.AuthUserStructMapper;
import com.mini.auth.model.dto.*;
import com.mini.auth.model.edit.AuthUserEdit;
import com.mini.auth.model.edit.AuthUserPasswordEdit;
import com.mini.auth.model.query.AuthUserQuery;
import com.mini.auth.model.request.AuthLoginRequest;
import com.mini.auth.model.request.AuthRegisterRequest;
import com.mini.auth.model.request.AuthUserRequest;
import com.mini.auth.model.request.AuthUserRoleRequest;
import com.mini.auth.model.vo.AuthUserDetailRouterVo;
import com.mini.auth.model.vo.AuthUserDetailVo;
import com.mini.auth.model.vo.AuthUserVo;
import com.mini.auth.service.IAuthPermissionService;
import com.mini.auth.service.IAuthRoleService;
import com.mini.auth.service.IAuthUserService;
import com.mini.base.model.dto.SysLoginOptDTO;
import com.mini.base.service.ISysLoginOptService;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.LoginConstant;
import com.mini.common.constant.RedisConstant;
import com.mini.common.constant.UserConstant;
import com.mini.common.enums.str.LoginOptType;
import com.mini.common.enums.str.UserQueryType;
import com.mini.common.enums.str.UserType;
import com.mini.common.enums.str.YesOrNo;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.model.LoginModel;
import com.mini.common.model.LoginUser;
import com.mini.common.utils.LoginUtils;
import com.mini.common.utils.SmCryptoUtil;
import com.mini.common.utils.SmHutoolUtil;
import com.mini.common.utils.TreeUtils;
import com.mini.common.utils.http.ServletUtil;
import com.mini.common.utils.redis.RedisUtils;
import com.mini.core.config.properties.CaptchaProperties;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author zhl
 * @create 2024/5/14 16:34
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class SysUserBiz {

    private final IAuthUserService authUserService;

    private final CaptchaProperties captchaProperties;

    private final ISysLoginOptService asyncLoginOptService;

    private final IAuthPermissionService authPermissionService;

    private final IAuthRoleService authRoleService;

    /**
     * 新增用户
     */
    @Transactional(rollbackFor = Exception.class)
    public void add(AuthUserRequest request) {
        AuthUserDTO authUserDTO = AuthUserStructMapper.INSTANCE.request2Dto(request);
        // 前端传入 sm2 的加密密文
        String password = SmHutoolUtil.sm2DecryptStr(authUserDTO.getPassword());
        // 对密码进行解密做 hash
        authUserDTO.setPassword(SmCryptoUtil.doHashValue(password));
        authUserService.insert(authUserDTO);
    }

    /**
     * 修改用户
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(AuthUserEdit edit) {
        if (LoginUtils.isSuperAdmin(edit.getId())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "超级管理员不可修改");
        }

        AuthUserDTO authUserDTO = AuthUserStructMapper.INSTANCE.edit2Dto(edit);
        authUserService.update(authUserDTO);
        // 关联角色
        if (CollectionUtils.isNotEmpty(edit.getRoleList())) {
            AuthUserRoleDTO authUserRoleDTO = new AuthUserRoleDTO();
            authUserRoleDTO.setId(edit.getId());

            List<String> roleCodeList = edit.getRoleList();
            List<AuthRoleDTO> authRoleDTOList = authRoleService.getRoleByCodeList(roleCodeList);
            List<Long> roleIdList = authRoleDTOList.stream().map(AuthRoleDTO::getId).collect(Collectors.toList());
            authUserRoleDTO.setRoleIdList(roleIdList);
            authUserService.relationUserAndRole(authUserRoleDTO);
        }
    }

    /**
     * 分页查询
     */
    public IPage<AuthUserVo> page(AuthUserQuery query) {
        IPage<AuthUserDTO> authUserDTOIPage = authUserService.selectPage(query);
        return authUserDTOIPage.convert(AuthUserStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 用户角色关联关系
     */
    @Transactional(rollbackFor = Exception.class)
    public void relationUserRole(AuthUserRoleRequest request) {
        if (LoginUtils.isSuperAdmin(request.getId())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "超级管理员不可修改");
        }
        AuthUserRoleDTO authUserRoleDTO = AuthUserRoleStructMapper.INSTANCE.req2Dto(request);
        authUserService.relationUserAndRole(authUserRoleDTO);
    }

    /**
     * 根据查询类型查询用户详细信息
     */
    public AuthUserDetailVo getUserRolePermissionById(long id, UserQueryType type) {
        AuthUserDetailDTO authUserDetailDTO = new AuthUserDetailDTO();
        switch (type) {
            case ALL:
                authUserDetailDTO = authUserService.getUserRolePermissionById(id);
                break;
            case ROLE:
                authUserDetailDTO = authUserService.getUserRoleById(id);
                break;
            case PERMISSION:
                authUserDetailDTO = authUserService.getUserPermissionById(id);
                break;
            case BASE:
                authUserDetailDTO = authUserService.getUserById(id);
                break;
            default:
                break;
        }
        return AuthUserStructMapper.INSTANCE.dtoDetail2Vo(authUserDetailDTO);
    }

    /**
     * 登录,三端登录汇总
     */
    public LoginModel login(AuthLoginRequest request) {

        if (UserType.MINI.equals(request.getUserType())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "请键入PC端类型");
        }

        // 校验验证码
        if (captchaProperties.isEnabled()) {
            if (Objects.isNull(request.getUuid()) || StringUtils.isBlank(request.getCode())) {
                throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "验证码不能为空");
            }
            checkCaptcha(request.getCode(), request.getUuid());
        }

        // 根据用户类型查询账户是否存在
        AuthUserDTO authUserDTO = authUserService.getUserByUsernameAndUserType(request.getUsername(), request.getUserType());

        if (Objects.isNull(authUserDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前登录用户不存在本系统，请先前往注册");
        }

        // 校验账户密码  sm2解密之后再进行hash，一致则为相同
        if (ObjectUtils.notEqual(SmCryptoUtil.doHashValue(SmHutoolUtil.sm2DecryptStr(request.getPassword())), authUserDTO.getPassword())) {
            SysLoginOptDTO dto = SysLoginOptDTO.builder().username(authUserDTO.getUsername())
                    .request(ServletUtil.getRequest())
                    .optType(LoginOptType.LOGIN)
                    .status(YesOrNo.NO)
                    .optMsg(LoginConstant.ACCOUNT_PASSWORD_ERROR)
                    .build();
            asyncLoginOptService.addLoginOptInfo(dto);
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "密码错误");
        }

        // 执行登录逻辑
        LoginUser loginUser = new LoginUser();
        loginUser.setUserId(authUserDTO.getId());
        loginUser.setUsername(authUserDTO.getUsername());
        loginUser.setUserType(request.getUserType());
        loginUser.setMenuPermission(authUserService.getUserPermissionByIdForSet(authUserDTO.getId()));
        loginUser.setRolePermission(authUserService.getUserRoleByIdForSet(authUserDTO.getId()));
        LoginUtils.loginByDevice(loginUser, request.getUserType(), request.getDeviceBy());

        // 删除验证码
        if (captchaProperties.isEnabled()) {
            String redisKey = RedisConstant.CAPTCHA_CODE_KEY + request.getUuid();
            RedisUtils.deleteObject(redisKey);
        }

        // 记录登录日志
        SysLoginOptDTO dto = SysLoginOptDTO.builder().username(loginUser.getUsername())
                .request(ServletUtil.getRequest())
                .optType(LoginOptType.LOGIN)
                .status(YesOrNo.YES)
                .optMsg(LoginConstant.LOGIN_SUCCESS)
                .build();
        asyncLoginOptService.addLoginOptInfo(dto);

        // 封装数据返回
        return LoginModel.builder().token(StpUtil.getTokenValue()).build();
    }

    /**
     * 校验验证码
     */
    private void checkCaptcha(String code, String uuid) {
        String redisKey = RedisConstant.CAPTCHA_CODE_KEY + uuid;
        String cacheCode = String.valueOf(
                Objects.nonNull(RedisUtils.getCacheObject(redisKey)) ? RedisUtils.getCacheObject(redisKey) : ""
        );
        if (StringUtils.isBlank(cacheCode)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "验证码已失效");
        }
        if (ObjectUtils.notEqual(cacheCode, code)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "验证码有误");
        }
    }

    /**
     * 登录之后获取用户基本信息
     */
    public AuthUserDetailVo getUserInfoBase() {
        LoginUser loginUser = LoginUtils.getLoginUser();
        Long userId = loginUser.getUserId();
        AuthUserDetailDTO authUserDetailDTO;
        // 小程序不需要权限，不做动态
        if (UserType.MINI.equals(loginUser.getUserType())) {
            authUserDetailDTO = authUserService.getUserById(userId);
        } else {
            authUserDetailDTO = authUserService.getUserRolePermissionById(userId);
        }
        AuthUserDetailVo authUserDetailVo = AuthUserStructMapper.INSTANCE.dtoDetail2Vo(authUserDetailDTO);
        authUserDetailVo.setPermissionList(loginUser.getMenuPermission());
        authUserDetailVo.setRoleList(loginUser.getRolePermission());
        return authUserDetailVo;
    }


    /**
     * 登出操作
     */
    public void logout() {
        try {
            LoginUser loginUser = LoginUtils.getLoginUser();

            // 记录登出日志
            SysLoginOptDTO dto = SysLoginOptDTO.builder().username(loginUser.getUsername())
                    .request(ServletUtil.getRequest())
                    .optType(LoginOptType.LOGOUT)
                    .status(YesOrNo.YES)
                    .optMsg(LoginConstant.LOGOUT_SUCCESS)
                    .build();
            asyncLoginOptService.addLoginOptInfo(dto);
        } finally {
            StpUtil.logout();
        }
    }

    /**
     * 用户注册操作 针对PC端
     */
    public void register(AuthRegisterRequest request) {

        if (UserType.MINI.equals(request.getUserType())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "暂不支持小程序注册");
        }

        AuthUserDTO authUserDTO = AuthUserStructMapper.INSTANCE.reqRegister2Dto(request);
        // 前端传入 sm2 的加密密文
        String password = SmHutoolUtil.sm2DecryptStr(authUserDTO.getPassword());
        // 对密码进行解密做 hash
        authUserDTO.setPassword(SmCryptoUtil.doHashValue(password));
        authUserService.insert(authUserDTO);
    }

    /**
     * 获取当前登录人的路由信息
     */
    public List<AuthUserDetailRouterVo> getUserInfoRouter() {
        List<AuthUserDetailRouterVo> authUserDetailRouterVoList;
        Long userId = LoginUtils.getUserId();
        if (UserConstant.SUPER_ADMIN_ID.equals(userId)) {
            authUserDetailRouterVoList = AuthPermissionStructMapper.INSTANCE.dtoList2RouterVoList(authPermissionService.selectAll());
        } else {
            List<AuthPermissionDTO> authPermissionDTOList = authUserService.getUserPermissionById(userId).getAuthPermissionDTOList();
            authUserDetailRouterVoList = AuthPermissionStructMapper.INSTANCE.dtoList2RouterVoList(authPermissionDTOList);
        }
        return TreeUtils.build(authUserDetailRouterVoList);
    }

    /**
     * 修改密码
     */
    public void updatePassword(AuthUserPasswordEdit edit) {
        authUserService.updatePassword(edit);
    }
}
