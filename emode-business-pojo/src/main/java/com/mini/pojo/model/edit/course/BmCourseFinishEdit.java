package com.mini.pojo.model.edit.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * @author zhl
 * @create 2025/1/2 17:24
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseFinishEdit {

    @NotNull(message = "课程id不能为空")
    @Schema(title = "课程id")
    private Long courseId;

}
