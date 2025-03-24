package com.mini.pojo.model.dto.sale;

import com.mini.common.enums.str.ProductType;
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
@Schema(description = "小程序课程商品展示")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmProductAppDTO {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "课程首页展示图片")
    private String productUrl;

    @Schema(title = "课程名称")
    private String productName;

    @Schema(title = "课程课时")
    private Integer productHour;

    @Schema(title = "商品价格")
    private Integer productPrice;

    @Schema(title = "优惠后价格")
    private Integer productReducedPrice;

    @Schema(title = "课程详细介绍，默认写死")
    private String courseDetail;

    @Schema(title = "商品课程类型 体验 长期")
    private ProductType productType;

    @Schema(title = "课程授课区间（周末、暑假）")
    private String classTime;
}
