package com.mini.pojo.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

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
public class BmClassGradeDTO {

    @Schema(name = "主键 id")
    private Long id;

    @Schema(name = "班级名称")
    private String classGradeName;

    @Schema(name = "教师 id")
    private Long teaId;

    @Schema(name = "教师名称")
    private String teaName;

    @Schema(name = "教室 id")
    private Long classroomId;

    @Schema(name = "教室名")
    private String classroomName;
}
