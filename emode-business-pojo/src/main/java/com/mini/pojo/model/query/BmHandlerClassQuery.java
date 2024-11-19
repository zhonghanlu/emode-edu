package com.mini.pojo.model.query;

import com.mini.common.enums.str.CourseType;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
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
@Schema(description = "待分班数据表")
@Data
@EqualsAndHashCode(callSuper = true)
public class BmHandlerClassQuery extends PageQuery {

    @Parameter(description = "学生 id")
    private Long stuId;

    @Parameter(description = "学生姓名")
    private String stuName;

    @Parameter(description = "意向上课时间")
    private LocalDateTime intentionCurTime;

    @Parameter(description = "核销时间")
    private LocalDateTime consumeTime;

    @Parameter(description = "课程类型")
    private CourseType curType;
}
