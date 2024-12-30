package com.mini.pojo.entity.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.CourseStatus;
import com.mini.common.enums.str.CourseType;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
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
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_course")
public class BmCourse extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键 id")
    @TableId
    private Long id;

    @Schema(name = "课程类型")
    private CourseType courseType;

    @Schema(name = "课程名称")
    private String courseName;

    @Schema(name = "周几")
    private Integer weekOne;

    @Schema(name = "课程开始时间")
    private LocalDateTime courseStartTime;

    @Schema(name = "课程结束时间")
    private LocalDateTime courseEndTime;

    @Schema(name = "班级人数")
    private Integer classPersonSize;

    @Schema(name = "教室 id")
    private Long classRoomId;

    @Schema(name = "教室名称")
    private String classRoomName;

    @Schema(name = "教师 id")
    private Long teaId;

    @Schema(name = "教师名称")
    private String teaName;

    @Schema(name = "班级 id")
    private Long classGradeId;

    @Schema(name = "班级名称")
    private String classGradeName;

    @Schema(name = "课程状态 待上课 已上课 已结束 已过期")
    private CourseStatus courseStatus;
}
