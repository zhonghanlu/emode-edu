package com.mini.pojo.model.edit.course;

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
@EqualsAndHashCode(callSuper = false)
public class BmCourseScheduleItemEdit {

    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "开始时间")
    private LocalDateTime rangeStartTime;

    @Schema(title = "结束时间")
    private LocalDateTime rangeEndTime;

    @Schema(title = "课程 id")
    private Long curId;

    @Schema(title = "课程名称")
    private String curName;

    @Schema(title = "课表主体 id")
    private Long curScheduleId;

    @Schema(title = "排序")
    private Integer sort;
}
