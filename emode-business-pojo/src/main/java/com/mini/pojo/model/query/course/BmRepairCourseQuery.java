package com.mini.pojo.model.query.course;

import com.mini.common.enums.str.CourseType;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * 补课数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "补课数据表")
@Data
@EqualsAndHashCode(callSuper = true)
public class BmRepairCourseQuery extends PageQuery {

    @Parameter(description = "补课名称")
    private String repairName;

    @Parameter(description = "课程类型")
    private CourseType curType;

    @Parameter(description = "周几")
    private Integer weekOne;

    @Parameter(description = "补课开始时间")
    private LocalDateTime repairStartTime;

    @Parameter(description = "补课结束时间")
    private LocalDateTime repairEndTime;
}
