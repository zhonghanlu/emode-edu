package com.mini.pojo.model.request.org;

import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author zhl
 * @create 2025/1/7 15:10
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStuHourConvertRequest {

    @Schema(title = "学生id")
    private Long stuId;

    @Schema(title = "待转的课程类型")
    private CourseType fromCourseType;

    @Schema(title = "需要转成的课程类型")
    private CourseType toCourseType;

}
