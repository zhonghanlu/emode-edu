package com.mini.pojo.entity.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.YesOrNo;
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
 * 缺课数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "缺课数据表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_lack_course")
public class BmLackCourse extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键 id")
    @TableId
    private Long id;

    @Schema(name = "班级id")
    private Long classGradeId;

    @Schema(name = "班级名称")
    private String classGradeName;

    @Schema(name = "课程类型")
    private CourseType curType;

    @Schema(name = "课程名称")
    private String curName;

    @Schema(name = "课程 id")
    private Long curId;

    @Schema(name = "周几")
    private Integer weekOne;

    @Schema(name = "缺课开始时间")
    private LocalDateTime lackStartTime;

    @Schema(name = "缺课结束时间")
    private LocalDateTime lackEndTime;

    @Schema(name = "学生姓名 id")
    private Long stuId;

    @Schema(name = "学生姓名")
    private String stuName;

    @Schema(name = "状态（未补课，已补课）")
    private YesOrNo lackStatus;
}
