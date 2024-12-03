package com.mini.pojo.model.query.sale;

import com.mini.common.enums.str.OrderStatus;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 补单（便于线下收款）
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Schema(description = "补单查询")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatchOrderQuery extends PageQuery {

    @Parameter(description = "补单商品名称")
    private String patchProductName;

    @Parameter(description = "补单核销人")
    private String patchConsume;

    @Parameter(description = "补单人手机号")
    private String patchPhone;

    @Parameter(description = "补单状态")
    private OrderStatus patchStatus;

    @Parameter(description = "补单操作人姓名")
    private String patchHandlerName;
}
