package com.mini.pojo.model.dto;

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
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseScheduleItemDTO {

    @Schema(name = "主键 id")
    private Long id;

    @Schema(name = "开始时间")
    private LocalDateTime rangeStartTime;

    @Schema(name = "结束时间")
    private LocalDateTime rangeEndTime;

    @Schema(name = "课程 id")
    private Long curId;

    @Schema(name = "课程名称")
    private String curName;

    @Schema(name = "课表主体 id")
    private Long curScheduleId;

    @Schema(name = "排序")
    private Integer sort;
}
