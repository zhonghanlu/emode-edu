package com.mini.pojo.model.edit.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 班级数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "班级数据表")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmClassGradeEdit {

    @NotNull(message = "待删除主键id不可为空")
    @Schema(title = "主键 id")
    private Long id;

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
}