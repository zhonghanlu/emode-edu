package com.mini.pojo.entity.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.ClassGradeStatus;
import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.enums.str.ProductType;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 班级数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "班级数据表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_class_grade")
public class BmClassGrade extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键 id")
    @TableId
    private Long id;

    @Schema(name = "班级名称")
    private String classGradeName;

    @Schema(name = "教师 id")
    private Long teaId;

    @Schema(name = "教师名称")
    private String teaName;

    @Schema(name = "教室 id")
    private Long classroomId;

    @Schema(name = "教室名")
    private String classroomName;

    @Schema(name = "课程类型")
    private CourseType curType;

    @Schema(name = "课程归属类型 长期 短期")
    private ProductType classGradeType;

    @Schema(title = "意向上课时间")
    private IntentionCurTime intentionCurTime;

    @Schema(title = "班级状态")
    private ClassGradeStatus classGradeStatus;
}
