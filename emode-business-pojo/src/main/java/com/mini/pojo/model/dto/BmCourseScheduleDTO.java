package com.mini.pojo.model.dto;

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
public class BmCourseScheduleDTO {

    @Schema(name = "主键 id")
    private Long id;

    @Schema(name = "课表名称")
    private String curScheduleName;

    @Schema(name = "课表开始时间")
    private LocalDateTime curScheduleStarTime;

    @Schema(name = "课表结束时间")
    private LocalDateTime curScheduleEndTime;
}
