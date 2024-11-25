package com.mini.pojo.model.edit;

import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * <p>
 * 课程表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "课程表")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseEdit {

    @NotNull(message = "课程主键id不可为空")
    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "课程类型")
    private CourseType courseType;

    @Schema(title = "课程名称")
    private String courseName;

    @Schema(title = "周几")
    private Integer weekOne;

    @Schema(title = "课程开始时间")
    private LocalDateTime courseStartTime;

    @Schema(title = "课程结束时间")
    private LocalDateTime courseEndTime;

    @Schema(title = "班级人数")
    private Integer classPersonSize;

    @Schema(title = "教室 id")
    private Long classRoomId;

    @Schema(title = "教室名称")
    private String classRoomName;

    @Schema(title = "教师 id")
    private Long teaId;

    @Schema(title = "教师名称")
    private String teaName;

    @Schema(title = "班级 id")
    private Long classGradeId;

    @Schema(title = "班级名称")
    private String classGradeName;
}
