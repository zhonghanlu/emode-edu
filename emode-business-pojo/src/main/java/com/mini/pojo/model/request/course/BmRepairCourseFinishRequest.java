package com.mini.pojo.model.request.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * @Author : zhl
 * @Date: 2025/1/11 17:53
 * @Description:
 */
@Data
@EqualsAndHashCode
public class BmRepairCourseFinishRequest {

    @NotNull(message = "补课 id不可为空")
    @Schema(title = "补课 id")
    private Long repairId;
}
