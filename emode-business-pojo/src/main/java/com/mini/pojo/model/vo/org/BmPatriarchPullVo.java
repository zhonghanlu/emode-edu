package com.mini.pojo.model.vo.org;

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
@Schema(description = "家长下拉展示")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatriarchPullVo {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "家长头像Url")
    private String patAvatarUrl;

    @Schema(title = "家长姓名")
    private String patName;

    @Schema(title = "家长手机号")
    private String patPhone;
}
