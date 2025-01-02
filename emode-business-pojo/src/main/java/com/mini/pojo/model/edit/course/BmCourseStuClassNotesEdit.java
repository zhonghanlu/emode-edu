package com.mini.pojo.model.edit.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author zhl
 * @create 2024/12/31 13:27
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseStuClassNotesEdit {

    /**
     * 课程id
     */
    @NotNull(message = "课程id不可为空")
    @Schema(title = "课程id")
    private Long courseId;

    /**
     * 讲义 list
     */
    @NotNull(message = "讲义不可为空")
    @Schema(title = "讲义list")
    private List<Long> handoutsList;

    /**
     * 作业 list
     */
    @NotNull(message = "作业不可为空")
    @Schema(title = "作业list")
    private List<Long> taskList;

}
