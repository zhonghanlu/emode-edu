package com.mini.pojo.model.vo.org;

import com.mini.common.enums.str.IntentionCurTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 教师意向时间关联表
 * </p>
 *
 * @author zhl
 * @since 2024-12-16
 */
@Schema(description = "教师意向时间关联表")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTeacherIntentionVo {

    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "意向时间")
    private IntentionCurTime intentionCurTime;

    @Schema(title = "班级 id")
    private Long classGradeId;

    @Schema(title = "班级名称")
    private String classGradeName;
}
