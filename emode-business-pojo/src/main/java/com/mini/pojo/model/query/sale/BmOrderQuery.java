package com.mini.pojo.model.query.sale;

import com.mini.common.enums.str.OrderStatus;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

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

    @Parameter(description = "订单商品名称")
    private String orderProductName;

    @Parameter(description = "订单核销人")
    private String orderConsume;

    @Parameter(description = "订单状态")
    private OrderStatus orderStatus;

    @Parameter(description = "订单人手机号")
    private String orderPhone;

    @Parameter(description = "学生姓名")
    private String orderConsumedName;
}
