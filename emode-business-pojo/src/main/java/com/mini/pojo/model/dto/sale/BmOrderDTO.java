package com.mini.pojo.model.dto.sale;

import com.mini.common.enums.str.OrderStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * 订单表
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmOrderDTO {

    @Schema(name = "主键id")
    private Long id;

    @Schema(name = "订单创建时间")
    private LocalDateTime orderCreateTime;

    @Schema(name = "订单总金额")
    private Integer orderPrice;

    @Schema(name = "订单优惠价格")
    private Integer orderReducedPrice;

    @Schema(name = "订单实际支付价格")
    private Integer orderActualPrice;

    @Schema(name = "订单商品名称")
    private String orderProductName;

    @Schema(name = "订单核销人")
    private String orderConsume;

    @Schema(name = "订单状态")
    private OrderStatus orderStatus;

    @Schema(name = "订单人手机号")
    private String orderPhone;

    @Schema(name = "被核销人（此处指学生）")
    private Long orderConsumedId;

    @Schema(name = "学生姓名")
    private String orderConsumedName;
}
