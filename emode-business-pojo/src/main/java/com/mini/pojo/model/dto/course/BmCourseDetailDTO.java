package com.mini.pojo.model.dto.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * @author zhonghanlu
 * @create 2025年2月14日16:00:37
 */
@Data
public class BmCourseDetailDTO {

    @Schema(title = "课程主键id")
    private Long courseId;

    @Schema(title = "课程类型")
    private CourseType courseType;

    @Schema(title = "课程名称")
    private String courseName;

    @Schema(title = "课程开始时间-LocalDate")
    private LocalDate courseStartTimeLocalDate;

    @Schema(title = "课程开始时间")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime courseStartTime;

    @Schema(title = "课程结束时间")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime courseEndTime;

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
