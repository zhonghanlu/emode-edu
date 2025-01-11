package com.mini.pojo.model.request.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 班级数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmClassGradeMoveStuRequest {

    @NotNull(message = "学生 id 不可为空")
    @Schema(title = "学生 id")
    private Long stuId;

    @NotNull(message = "原班级 id 不可为空")
    @Schema(title = "原班级 id")
    private Long fromClassGradeId;

    @NotNull(message = "现班级 id 不可为空")
    @Schema(title = "现班级 id")
    private Long toClassGradeId;

}
