package com.mini.pojo.model.request.wx;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @Author : zhl
 * @Date: 2025/3/17 20:57
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmWxLoginRequest {

    @NotBlank(message = "唯一标识不可为空")
    @Schema(title = "微信用户唯一标识")
    private String unionId;

    @Schema(title = "微信用户次主体下唯一标识")
    private String openId;

    @NotBlank(message = "微信名称不可为空")
    @Schema(title = "微信名称")
    private String wxName;

    @Schema(title = "微信头像id")
    private Long avatarId;

    @Schema(title = "微信头像url")
    private String avatarUrl;

    @NotNull(message = "微信登录手机号不可为空")
    @Schema(title = "微信登录手机号")
    private Long phoneNumber;

    @Schema(title = "微信地址")
    private String address;
}
