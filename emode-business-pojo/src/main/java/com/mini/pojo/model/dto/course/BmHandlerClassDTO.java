package com.mini.pojo.model.dto.course;

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
public class BmHandlerClassDTO {

    @Schema(name = "主键 id")
    private Long id;

    @Schema(name = "学生 id")
    private Long stuId;

    @Schema(name = "学生姓名")
    private String stuName;

    @Schema(name = "意向上课时间")
    private BmIntentionCurTimeDTO intentionCurTime;

    @Schema(name = "意向上课时间")
    private String intentionCurTimeStr;

    @Schema(name = "核销时间")
    private LocalDateTime consumeTime;

    @Schema(name = "课程类型")
    private CourseType curType;
}
