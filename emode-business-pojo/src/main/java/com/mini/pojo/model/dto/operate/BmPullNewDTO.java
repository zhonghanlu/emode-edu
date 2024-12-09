package com.mini.pojo.model.dto.operate;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 拉新统一汇总表
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPullNewDTO {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "拉新人id")
    private Long sourcePatriarchId;

    @Schema(title = "拉新人姓名")
    private String sourcePatriarchName;

    @Schema(title = "邀请码")
    private String invitationCode;

    @Schema(title = "被拉新人id")
    private Long newPatriarchId;

    @Schema(title = "被拉新人姓名")
    private String newPatriarchName;

    @Schema(title = "奖励")
    private String reward;

    @Schema(title = "原因")
    private String reason;

}
