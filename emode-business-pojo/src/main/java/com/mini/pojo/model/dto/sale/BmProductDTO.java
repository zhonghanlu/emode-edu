package com.mini.pojo.model.dto.sale;

import com.mini.common.enums.str.ClassType;
import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.ProductShowStatus;
import com.mini.common.enums.str.ProductStatus;
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
@Data
@EqualsAndHashCode(callSuper = false)
public class BmProductDTO {

    @Schema(name = "主键id")
    private Long id;

    @Schema(name = "课程首页展示图片")
    private String productUrl;

    @Schema(name = "课程首页展示图片id")
    private Long productUrlId;

    @Schema(name = "课程名称")
    private String productName;

    @Schema(name = "课程课时")
    private Integer productHour;

    @Schema(name = "商品价格")
    private Integer productPrice;

    @Schema(name = "优惠后价格")
    private Integer productReducedPrice;

    @Schema(name = "推荐年龄")
    private Integer recommendAge;

    @Schema(name = "课程详细介绍，默认写死")
    private String courseDetail;

    @Schema(name = "课程语言类型")
    private CourseType productType;

    @Schema(name = "授课类型，线上、线下....")
    private ClassType classType;

    @Schema(name = "课程状态")
    private ProductStatus status;

    @Schema(name = "课程授课区间（周末、暑假）")
    private String classTime;

    @Schema(name = "上下架状态")
    private ProductShowStatus showStatus;
}
