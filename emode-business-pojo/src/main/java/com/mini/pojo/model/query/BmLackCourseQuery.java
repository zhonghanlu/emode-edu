package com.mini.pojo.model.query;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.YesOrNo;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
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
@EqualsAndHashCode(callSuper = true)
public class BmLackCourseQuery extends PageQuery {

    @Parameter(description = "课程类型")
    private CourseType curType;

    @Parameter(description = "课程名称")
    private String curName;

    @Parameter(description = "周几")
    private Integer weekOne;

    @Parameter(description = "缺课开始时间")
    private LocalDateTime lackStartTime;

    @Parameter(description = "缺课结束时间")
    private LocalDateTime lackEndTime;

    @Parameter(description = "学生姓名")
    private String stuName;

    @Parameter(description = "状态（未补课，已补课）")
    private YesOrNo lackStatus;
}
