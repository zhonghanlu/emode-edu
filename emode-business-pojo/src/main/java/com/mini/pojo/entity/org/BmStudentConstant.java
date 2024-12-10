package com.mini.pojo.entity.org;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 学生学校与年级常量数据表
 * </p>
 *
 * @author zhl
 * @since 2024-12-10
 */
@Schema(description = "学生学校与年级常量数据表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("bm_student_constant")
public class BmStudentConstant implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键 id")
    @TableId
    private Long id;

    @Schema(title = "类型school 学校  grade 年级 ")
    private String type;

    @Schema(title = "key 值")
    private String constantKey;

    @Schema(title = "计算值")
    private Integer constantValue;

    public static final String SCHOOL_TYPE = "school";

    public static final String GRADE_TYPE = "grade";
}
