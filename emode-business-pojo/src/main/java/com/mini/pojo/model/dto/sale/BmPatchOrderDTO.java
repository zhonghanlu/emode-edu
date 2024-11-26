package com.mini.pojo.model.dto.sale;

import com.mini.common.enums.str.OrderStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * 补单（便于线下收款）
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatchOrderDTO {

    @Schema(name = "主键id")
    private Long id;

    @Schema(name = "补单时间")
    private LocalDateTime patchCreateTime;

    @Schema(name = "补单总计价格")
    private Integer patchPrice;

    @Schema(name = "补单优惠价格")
    private Integer patchReducedPrice;

    @Schema(name = "补单实际价格")
    private Integer patchActualPrice;

    @Schema(name = "补单商品名称")
    private String patchProductName;

    @Schema(name = "补单核销人")
    private String patchConsume;

    @Schema(name = "补单人手机号")
    private String patchPhone;

    @Schema(name = "补单状态")
    private OrderStatus patchStatus;

    @Schema(name = "补单操作人id")
    private Long patchHandlerId;

    @Schema(name = "补单操作人姓名")
    private String patchHandlerName;
}
