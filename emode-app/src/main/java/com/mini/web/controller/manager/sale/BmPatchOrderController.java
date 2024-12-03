package com.mini.web.controller.manager.sale;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.sale.BmPatchOrderBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.sale.BmPatchOrderEdit;
import com.mini.pojo.model.query.sale.BmPatchOrderQuery;
import com.mini.pojo.model.request.sale.BmPatchOrderRequest;
import com.mini.pojo.model.vo.sale.BmPatchOrderVo;
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
 * 补单（便于线下收款） 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Tag(name = "订单(补单)管理", description = "订单(补单)管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-patch-order")
@RequiredArgsConstructor
public class BmPatchOrderController {

    private final BmPatchOrderBiz bmPatchOrderBiz;

    @Operation(summary = "补单分页")
    @GetMapping("/page")
    public Restful<IPage<BmPatchOrderVo>> page(@ParameterObject BmPatchOrderQuery query) {
        return Restful.OBJECT(bmPatchOrderBiz.page(query)).build();
    }

    @Operation(summary = "补单详情")
    @GetMapping("/detail/{patchId}")
    public Restful<BmPatchOrderVo> getDetailById(@PathVariable("patchId") Long id) {
        return Restful.OBJECT(bmPatchOrderBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增补单信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmPatchOrderRequest request) {
        bmPatchOrderBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除补单信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmPatchOrderBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改补单信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmPatchOrderEdit edit) {
        bmPatchOrderBiz.update(edit);
        return Restful.SUCCESS().build();
    }
}
