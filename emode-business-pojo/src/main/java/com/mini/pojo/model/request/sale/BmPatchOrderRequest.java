package com.mini.pojo.model.request.sale;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 补单（便于线下收款）
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Schema(description = "补单请求")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatchOrderRequest {

    @NotNull(message = "商品 id 不可为空")
    @Schema(title = "补单商品 id")
    private Long productId;

    @NotNull(message = "家长 id 不可为空")
    @Schema(title = "补单家长 id")
    private Long patriarchId;

    @NotNull(message = "学生 id 不可为空")
    @Schema(title = "补单学生 id")
    private Long studentId;

}
