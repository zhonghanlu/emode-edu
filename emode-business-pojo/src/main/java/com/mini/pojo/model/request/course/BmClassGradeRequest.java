package com.mini.pojo.model.request.course;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.ProductType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 班级数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmClassGradeRequest {

    @NotBlank(message = "班级名称不可为空")
    @Schema(title = "班级名称")
    private String classGradeName;

    @Schema(title = "教师 id")
    private Long teaId;

    @Schema(title = "教师名称")
    private String teaName;

    @Schema(title = "教室 id")
    private Long classroomId;

    @Schema(title = "教室名")
    private String classroomName;

    @Schema(name = "课程类型")
    private CourseType curType;

    @Schema(name = "课程归属类型 长期 短期")
    private ProductType classGardeType;
}
