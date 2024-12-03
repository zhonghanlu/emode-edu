package com.mini.pojo.model.dto.edu;

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
public class BmTutorApplyDTO {

    @Schema(name = "主键 id")
    private Long id;

    @Schema(name = "申请人 id")
    private Long applyStuId;

    @Schema(name = "申请人姓名")
    private String applyName;

    @Schema(name = "申请科目")
    private CourseType applySubject;

    @Schema(name = "申请时间")
    private String applyTime;

    @Schema(name = "申请家教老师 id")
    private Long applyTutorId;

    @Schema(name = "申请家教老师姓名")
    private String applyTutorTeaName;

    @Schema(name = "消耗课时")
    private Integer expendClassHour;

    @Schema(name = "申请地址")
    private String applyAddress;

    @Schema(name = "申请状态")
    private ApplyStatus applyStatus;
}
