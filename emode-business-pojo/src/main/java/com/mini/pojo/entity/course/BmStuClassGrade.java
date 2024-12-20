package com.mini.pojo.entity.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.CourseType;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 学生和班级关系
 * </p>
 *
 * @author zhl
 * @since 2024-12-20
 */
@Schema(description = "学生和班级关系")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_stu_class_grade")
public class BmStuClassGrade extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键id")
    @TableId
    private Long id;

    @Schema(title = "学生id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "课程类型")
    private CourseType courseType;

    @Schema(title = "班级id")
    private Long classGradeId;

    @Schema(title = "班级名称")
    private String classGradeName;

}
