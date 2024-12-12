package com.mini.pojo.model.dto.org;

import com.baomidou.mybatisplus.annotation.TableId;
import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 学生与课时关系
 * </p>
 *
 * @author zhl
 * @since 2024-12-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStuClassHourDTO implements Serializable {

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
