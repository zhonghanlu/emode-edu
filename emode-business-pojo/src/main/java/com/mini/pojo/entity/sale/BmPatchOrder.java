package com.mini.pojo.entity.sale;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 补单（便于线下收款）
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Schema(description = "补单（便于线下收款）")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_patch_order")
public class BmPatchOrder extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键id")
    @TableId(value = "id")
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
    private String patchStatus;

    @Schema(name = "补单操作人id")
    private Long patchHandlerId;

    @Schema(name = "补单操作人姓名")
    private String patchHandlerName;
}
