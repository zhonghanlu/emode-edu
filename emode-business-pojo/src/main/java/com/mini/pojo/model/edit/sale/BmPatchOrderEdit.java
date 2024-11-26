package com.mini.pojo.model.edit.sale;

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
@Schema(description = "补单修改")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatchOrderEdit {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "补单时间")
    private LocalDateTime patchCreateTime;

    @Schema(title = "补单总计价格")
    private Integer patchPrice;

    @Schema(title = "补单优惠价格")
    private Integer patchReducedPrice;

    @Schema(title = "补单实际价格")
    private Integer patchActualPrice;

    @Schema(title = "补单商品名称")
    private String patchProductName;

    @Schema(title = "补单核销人")
    private String patchConsume;

    @Schema(title = "补单人手机号")
    private String patchPhone;

    @Schema(title = "补单状态")
    private OrderStatus patchStatus;

    @Schema(title = "补单操作人id")
    private Long patchHandlerId;

    @Schema(title = "补单操作人姓名")
    private String patchHandlerName;
}
