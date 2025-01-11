package com.mini.pojo.model.request.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * @Author : zhl
 * @Date: 2025/1/11 16:03
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmClassGradeMoveOutRequest {

    @NotNull(message = "学生 id 不可为空")
    @Schema(title = "学生 id")
    private Long stuId;

    @NotNull(message = "原班级 id 不可为空")
    @Schema(title = "原班级 id")
    private Long classGradeId;

}
