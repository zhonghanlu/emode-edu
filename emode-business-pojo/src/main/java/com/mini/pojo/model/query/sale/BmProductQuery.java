package com.mini.pojo.model.query.sale;

import com.mini.common.enums.str.ClassType;
import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.ProductShowStatus;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 课程商品表
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Schema(description = "课程商品查询")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmProductQuery extends PageQuery {

    @Parameter(description = "课程名称")
    private String productName;

    @Parameter(description = "课程课时")
    private Integer productHour;

    @Parameter(description = "课程语言类型")
    private CourseType productType;

    @Parameter(description = "授课类型，线上、线下....")
    private ClassType classType;

    @Parameter(description = "课程授课区间（周末、暑假）")
    private String classTime;

    @Parameter(description = "上下架状态")
    private ProductShowStatus showStatus;
}
