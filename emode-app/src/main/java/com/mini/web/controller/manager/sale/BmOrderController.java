package com.mini.web.controller.manager.sale;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.sale.BmOrderBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.sale.BmOrderEdit;
import com.mini.pojo.model.query.sale.BmOrderQuery;
import com.mini.pojo.model.request.sale.BmOrderRequest;
import com.mini.pojo.model.vo.sale.BmOrderVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * <p>
 * 订单表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Tag(name = "订单管理", description = "订单管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-order")
@RequiredArgsConstructor
public class BmOrderController {

    private final BmOrderBiz bmOrderBiz;

    @Operation(summary = "订单分页")
    @GetMapping("/page")
    public Restful<IPage<BmOrderVo>> page(@ParameterObject BmOrderQuery query) {
        return Restful.OBJECT(bmOrderBiz.page(query)).build();
    }

    @Operation(summary = "订单详情")
    @GetMapping("/detail/{orderId}")
    public Restful<BmOrderVo> getDetailById(@PathVariable("orderId") Long id) {
        return Restful.OBJECT(bmOrderBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增订单信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmOrderRequest request) {
        bmOrderBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除订单信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmOrderBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改订单信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmOrderEdit edit) {
        bmOrderBiz.update(edit);
        return Restful.SUCCESS().build();
    }

}
