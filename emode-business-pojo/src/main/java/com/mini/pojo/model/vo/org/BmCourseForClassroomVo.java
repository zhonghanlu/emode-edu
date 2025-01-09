package com.mini.pojo.model.vo.org;

import com.mini.common.enums.str.CourseStatus;
import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * 课程表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "课程展示")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseForClassroomVo {

    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "课程类型")
    private CourseType courseType;

    @Schema(title = "课程名称")
    private String courseName;

    @Schema(title = "课程开始时间")
    private LocalDateTime courseStartTime;

    @Schema(title = "课程结束时间")
    private LocalDateTime courseEndTime;

    @Schema(title = "教师名称")
    private String teaName;

    @Schema(title = "班级名称")
    private String classGradeName;

    @Schema(name = "课程状态 待上课 已上课 已结束 已过期")
    private CourseStatus courseStatus;
}
