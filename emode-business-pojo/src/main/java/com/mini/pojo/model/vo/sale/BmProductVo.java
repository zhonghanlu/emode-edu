package com.mini.pojo.model.vo.sale;

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
@Schema(description = "课程商品展示")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmProductVo {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "课程首页展示图片")
    private String productUrl;

    @Schema(title = "课程首页展示图片id")
    private Long productUrlId;

    @Schema(title = "课程名称")
    private String productName;

    @Schema(title = "课程课时")
    private Integer productHour;

    @Schema(title = "商品价格")
    private Integer productPrice;

    @Schema(title = "优惠后价格")
    private Integer productReducedPrice;

    @Schema(title = "推荐年龄")
    private Integer recommendAge;

    @Schema(title = "课程详细介绍，默认写死")
    private String courseDetail;

    @Schema(title = "课程语言类型")
    private CourseType productType;

    @Schema(title = "授课类型，线上、线下....")
    private ClassType classType;

    @Schema(title = "课程状态")
    private ProductStatus status;

    @Schema(title = "课程授课区间（周末、暑假）")
    private String classTime;

    @Schema(title = "上下架状态")
    private ProductShowStatus showStatus;
}
