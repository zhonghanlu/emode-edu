package com.mini.pojo.model.request.edu;

import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

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
public class BmTutorApplyRequest {

    @NotNull(message = "申请人id不可为空")
    @Schema(title = "申请人 id")
    private Long applyStuId;

    @NotBlank(message = "申请人姓名不可为空")
    @Schema(title = "申请人姓名")
    private String applyName;

    @NotNull(message = "申请科目不可为空")
    @Schema(title = "申请科目")
    private CourseType applySubject;

    @Schema(title = "申请时间")
    private String applyTime;

    @NotNull(message = "申请人家教老师id不可为空")
    @Schema(title = "申请家教老师 id")
    private Long applyTutorId;

    @Schema(title = "申请家教老师姓名")
    private String applyTutorTeaName;

    @Schema(title = "消耗课时")
    private Integer expendClassHour;

    @Schema(title = "申请地址")
    private String applyAddress;
}
