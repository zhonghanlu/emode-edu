package com.mini.pojo.model.request.course;

import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

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
public class BmRepairCourseRequest {

    @NotNull(message = "补课名称不可为空")
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

    @NotNull(message = "缺课idList不可为空")
    @Schema(title = "缺课 id list")
    private List<Long> lackCourseIdList;
}
