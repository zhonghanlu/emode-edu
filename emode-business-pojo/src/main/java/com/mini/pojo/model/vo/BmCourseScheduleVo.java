package com.mini.pojo.model.vo;

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
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseScheduleVo {

    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "课表名称")
    private String curScheduleName;

    @Schema(title = "课表开始时间")
    private LocalDateTime curScheduleStarTime;

    @Schema(title = "课表结束时间")
    private LocalDateTime curScheduleEndTime;
}
