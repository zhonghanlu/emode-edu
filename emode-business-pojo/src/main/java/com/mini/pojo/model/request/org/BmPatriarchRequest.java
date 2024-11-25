package com.mini.pojo.model.request.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 家长表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "家长请求")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatriarchRequest {

    @Schema(title = "家长头像")
    private Long patAvatarId;

    @NotBlank(message = "姓名不可为空")
    @Schema(title = "家长姓名")
    private String patName;

    @NotBlank(message = "手机号不可为空")
    @Schema(title = "家长手机号")
    private String patIphone;

    @Schema(title = "家长微信")
    private String patWx;

    @Schema(title = "家长地址")
    private String patAddress;

}
