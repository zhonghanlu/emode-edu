package com.mini.pojo.model.query;

import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * 课表内容主体表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "课表内容主体表")
@Data
@EqualsAndHashCode(callSuper = true)
public class BmCourseScheduleItemQuery extends PageQuery {

    @Parameter(description = "开始时间")
    private LocalDateTime rangeStartTime;

    @Parameter(description = "结束时间")
    private LocalDateTime rangeEndTime;

    @Parameter(description = "课程 id")
    private Long curId;

    @Parameter(description = "课程名称")
    private String curName;

    @Parameter(description = "课表主体 id")
    private Long curScheduleId;

    @Parameter(description = "排序")
    private Integer sort;
}
