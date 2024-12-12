package com.mini.pojo.entity.org;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 学生与课时关系
 * </p>
 *
 * @author zhl
 * @since 2024-12-12
 */
@Schema(description = "学生与课时关系")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("bm_stu_class_hour")
public class BmStuClassHour implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键 id")
    @TableId
    private Long id;

    @Schema(title = "课时类型")
    private CourseType classHourType;

    @Schema(title = "课时默认乘 100 计算逻辑")
    private Long classHour;

    @Schema(title = "学生 id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;


}
