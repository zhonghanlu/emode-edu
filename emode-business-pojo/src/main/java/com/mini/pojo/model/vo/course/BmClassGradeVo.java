package com.mini.pojo.model.vo.course;

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
public class BmClassGradeVo {

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
