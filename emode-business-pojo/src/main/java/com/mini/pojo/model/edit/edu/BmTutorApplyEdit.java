package com.mini.pojo.model.edit.edu;

import com.mini.common.enums.str.ApplyStatus;
import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 家教申请
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTutorApplyEdit {

    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "申请人 id")
    private Long applyStuId;

    @Schema(title = "申请人姓名")
    private String applyName;

    @Schema(title = "申请科目")
    private CourseType applySubject;

    @Schema(title = "申请时间")
    private String applyTime;

    @Schema(title = "申请家教老师 id")
    private Long applyTutorId;

    @Schema(title = "申请家教老师姓名")
    private String applyTutorTeaName;

    @Schema(title = "消耗课时")
    private Integer expendClassHour;

    @Schema(title = "申请地址")
    private String applyAddress;

    @Schema(title = "申请状态")
    private ApplyStatus applyStatus;
}
