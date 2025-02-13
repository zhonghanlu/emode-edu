package com.mini.pojo.model.vo.course;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.ProductType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 班级数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "班级展示")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmSimpleClassGradeVo {

    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "班级名称")
    private String classGradeName;

    @Schema(title = "课程类型")
    private CourseType curType;

    @Schema(title = "课程归属类型 长期 短期")
    private ProductType classGradeType;
}
