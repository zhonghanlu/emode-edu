package com.mini.pojo.model.request.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
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
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseRequest {

    @NotNull(message = "课程类型不可为空")
    @Schema(title = "课程类型")
    private CourseType courseType;

    @NotBlank(message = "课程名称不可为空")
    @Schema(title = "课程名称")
    private String courseName;

    @NotNull(message = "课程开始时间不可为空")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(title = "课程开始时间")
    private LocalDateTime courseStartTime;

    @NotNull(message = "课程结束时间不可为空")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(title = "课程结束时间")
    private LocalDateTime courseEndTime;

    @NotNull(message = "班级人数不可为空")
    @Schema(title = "班级人数")
    private Integer classPersonSize;

    @NotNull(message = "教室 id不可为空")
    @Schema(title = "教室 id")
    private Long classRoomId;

    @Schema(title = "教室名称")
    private String classRoomName;

    @NotNull(message = "教师 id不可为空")
    @Schema(title = "教师 id")
    private Long teaId;

    @Schema(title = "教师名称")
    private String teaName;

    @NotNull(message = "班级 id不可为空")
    @Schema(title = "班级 id")
    private Long classGradeId;

    @Schema(title = "班级名称")
    private String classGradeName;
}
