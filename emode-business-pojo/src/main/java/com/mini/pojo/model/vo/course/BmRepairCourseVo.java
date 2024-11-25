package com.mini.pojo.model.vo.course;

import com.mini.common.enums.str.CourseType;
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
@Data
@EqualsAndHashCode(callSuper = false)
public class BmRepairCourseVo {

    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "补课名称")
    private String repairName;

    @Schema(title = "课程类型")
    private CourseType curType;

    @Schema(title = "周几")
    private Integer weekOne;

    @Schema(title = "补课开始时间")
    private LocalDateTime repairStartTime;

    @Schema(title = "补课结束时间")
    private LocalDateTime repairEndTime;
}
