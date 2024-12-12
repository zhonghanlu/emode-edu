package com.mini.pojo.model.dto.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 家长表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatriarchDTO {

    @Schema(name = "主键id")
    private Long id;

    @Schema(name = "家长头像")
    private Long patAvatarId;

    @Schema(name = "家长头像url")
    private String patAvatarUrl;

    @Schema(name = "家长姓名")
    private String patName;

    @Schema(name = "家长手机号")
    private String patPhone;

    @Schema(name = "家长微信")
    private String patWx;

    @Schema(name = "家长地址")
    private String patAddress;

}
