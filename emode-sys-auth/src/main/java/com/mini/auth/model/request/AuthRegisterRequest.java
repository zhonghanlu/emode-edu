package com.mini.auth.model.request;

import com.mini.common.enums.str.UserType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @author zhl
 * @create 2024/7/18 15:10
 */
@Data
public class AuthRegisterRequest {

    /**
     * 用户名
     */
    @Schema(title = "用户名")
    @NotEmpty(message = "用户名不可为空")
    private String username;
    /**
     * 密码
     */
    @Schema(title = "密码")
    @NotEmpty(message = "密码不可为空")
    private String password;
    /**
     * 昵称
     */
    @Schema(title = "昵称")
    @NotEmpty(message = "昵称不可为空")
    private String nickname;
    /**
     * 头像id
     */
    @Schema(title = "头像id")
    private Long avatarId;
    /**
     * 手机号
     */
    @Schema(title = "手机号")
    @NotEmpty(message = "手机号不可为空")
    private String phone;
    /**
     * 用户类型
     */
    @NotNull(message = "用户类型不可为空")
    @Schema(title = "用户类型小程序:mini,管理端：manager，电脑端：pc")
    private UserType userType;

}
