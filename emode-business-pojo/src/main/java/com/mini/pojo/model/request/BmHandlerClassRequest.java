package com.mini.pojo.model.request;

import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * 待分班数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmHandlerClassRequest {

    @Schema(title = "学生 id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "意向上课时间")
    private LocalDateTime intentionCurTime;

    @Schema(title = "核销时间")
    private LocalDateTime consumeTime;

    @Schema(title = "课程类型")
    private CourseType curType;
}
