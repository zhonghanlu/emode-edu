package com.mini.pojo.model.query;

import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * 课表主表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "课表主表")
@Data
@EqualsAndHashCode(callSuper = true)
public class BmCourseScheduleQuery extends PageQuery {

    @Parameter(description = "课表名称")
    private String curScheduleName;

    @Parameter(description = "课表开始时间")
    private LocalDateTime curScheduleStarTime;

    @Parameter(description = "课表结束时间")
    private LocalDateTime curScheduleEndTime;
}
