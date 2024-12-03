package com.mini.web.controller.manager.sale;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.sale.BmProductBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.sale.BmProductEdit;
import com.mini.pojo.model.query.sale.BmProductQuery;
import com.mini.pojo.model.request.sale.BmProductRequest;
import com.mini.pojo.model.vo.sale.BmProductVo;
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
 * 课程商品表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Tag(name = "课程商品管理", description = "订课程商品管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-product")
@RequiredArgsConstructor
public class BmProductController {

    private final BmProductBiz bmProductBiz;

    @Operation(summary = "商品分页")
    @GetMapping("/page")
    public Restful<IPage<BmProductVo>> page(@ParameterObject BmProductQuery query) {
        return Restful.OBJECT(bmProductBiz.page(query)).build();
    }

    @Operation(summary = "商品详情")
    @GetMapping("/detail/{productId}")
    public Restful<BmProductVo> getDetailById(@PathVariable("productId") Long id) {
        return Restful.OBJECT(bmProductBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增商品信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmProductRequest request) {
        bmProductBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除商品信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmProductBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改商品信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmProductEdit edit) {
        bmProductBiz.update(edit);
        return Restful.SUCCESS().build();
    }
}
