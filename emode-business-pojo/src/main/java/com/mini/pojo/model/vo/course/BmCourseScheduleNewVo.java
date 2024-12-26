package com.mini.pojo.model.vo.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @author zhl
 * @create 2024/12/26 15:19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseScheduleNewVo {

    @Schema(title = "课表名称")
    private String curScheduleName;

    @Schema(title = "课表开始时间")
    private LocalDateTime curScheduleStarTime;

    @Schema(title = "课表结束时间")
    private LocalDateTime curScheduleEndTime;

}
