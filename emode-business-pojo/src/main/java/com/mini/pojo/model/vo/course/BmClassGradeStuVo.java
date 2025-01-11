package com.mini.pojo.model.vo.course;

import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author : zhl
 * @Date: 2025/1/11 15:25
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmClassGradeStuVo {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "课时类型")
    private CourseType classHourType;

    @Schema(title = "课时默认乘 100 计算逻辑")
    private Long classHour;

}
