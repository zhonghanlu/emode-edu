package com.mini.pojo.entity.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 待分班与课程订单关联表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "待分班与课程订单关联表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_handler_class_order_relation")
public class BmHandlerClassOrderRelation extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键 id")
    @TableId
    private Long id;

    @Schema(name = "核销人（待分班）id")
    private Long handlerClassId;

    @Schema(name = "课程订单 id")
    private Long curOrderId;

    @Schema(name = "课程名称")
    private String curName;
}
