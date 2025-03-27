package com.mini.pojo.model.query.business;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.CurTutorType;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author : zhl
 * @Date: 2025/3/27 20:59
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTutorQuery {

    @Parameter(description = "学生id")
    private Long stuId;

    @Parameter(description = "教师id")
    private Long tutorId;

    @Parameter(description = "整数课时，默认乘10000")
    private Long classHour;

    @Parameter(description = "课程类型")
    private CourseType courseType;

    @Parameter(description = "上课类型")
    private CurTutorType curTutorType;

}
