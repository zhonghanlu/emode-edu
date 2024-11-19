package com.mini.pojo.model.edit;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.YesOrNo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * 缺课数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "缺课数据表")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmLackCourseEdit{

    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "班级id")
    private Long classGradeId;

    @Schema(title = "班级名称")
    private String classGradeName;

    @Schema(title = "课程类型")
    private CourseType curType;

    @Schema(title = "课程名称")
    private String curName;

    @Schema(title = "课程 id")
    private Long curId;

    @Schema(title = "周几")
    private Integer weekOne;

    @Schema(title = "缺课开始时间")
    private LocalDateTime lackStartTime;

    @Schema(title = "缺课结束时间")
    private LocalDateTime lackEndTime;

    @Schema(title = "学生姓名 id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "状态（未补课，已补课）")
    private YesOrNo lackStatus;
}
