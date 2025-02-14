package com.mini.pojo.model.query.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mini.common.enums.str.CourseStatus;
import com.mini.common.enums.str.CourseType;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

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
@EqualsAndHashCode(callSuper = true)
public class BmCourseQuery extends PageQuery {

    @Parameter(description = "课程类型")
    private CourseType courseType;

    @Parameter(description = "课程名称")
    private String courseName;

    @Parameter(description = "周几")
    private Integer weekOne;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Parameter(description = "课程开始时间")
    private LocalDateTime courseStartTime;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Parameter(description = "课程结束时间")
    private LocalDateTime courseEndTime;

    @Parameter(description = "教室名称")
    private String classRoomName;

    @Parameter(description = "教师名称")
    private String teaName;

    @Parameter(description = "班级名称")
    private String classGradeName;

    @Parameter(description = "课程状态 待上课 已上课 已结束 已过期")
    private CourseStatus courseStatus;
}
