package com.mini.pojo.entity.operate;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 拉新统一汇总表
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Schema(description = "拉新统一汇总表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_pull_new")
public class BmPullNew extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键id")
    @TableId
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
