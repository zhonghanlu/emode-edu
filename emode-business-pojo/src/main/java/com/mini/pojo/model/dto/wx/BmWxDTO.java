package com.mini.pojo.model.dto.wx;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author : zhl
 * @Date: 2025/3/17 21:48
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmWxDTO {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "微信用户唯一标识")
    private String unionId;

    @Schema(title = "微信用户次主体下唯一标识")
    private String openId;

    @Schema(title = "微信名称")
    private String wxName;

    @Schema(title = "微信头像id")
    private Long avatarId;

    @Schema(title = "微信头像url")
    private String avatarUrl;

    @Schema(title = "微信登录手机号")
    private Long phoneNumber;

    @Schema(title = "微信地址")
    private String address;

}
