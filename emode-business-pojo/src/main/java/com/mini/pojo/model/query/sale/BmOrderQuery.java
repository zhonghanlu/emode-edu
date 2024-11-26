package com.mini.pojo.model.query.sale;

import com.mini.common.enums.str.OrderStatus;
import com.mini.common.utils.webmvc.PageQuery;
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
@Schema(description = "订单查询")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmOrderQuery extends PageQuery {

    @Schema(title = "订单创建时间")
    private LocalDateTime orderCreateTime;

    @Schema(title = "订单总金额")
    private Integer orderPrice;

    @Schema(title = "订单优惠价格")
    private Integer orderReducedPrice;

    @Schema(title = "订单实际支付价格")
    private Integer orderActualPrice;

    @Schema(title = "订单商品名称")
    private String orderProductName;

    @Schema(title = "订单核销人")
    private String orderConsume;

    @Schema(title = "订单状态")
    private OrderStatus orderStatus;

    @Schema(title = "订单人手机号")
    private String orderPhone;

    @Schema(title = "被核销人（此处指学生）")
    private Long orderConsumedId;

    @Schema(title = "学生姓名")
    private String orderConsumedName;
}
