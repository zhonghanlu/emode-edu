package com.mini.web.controller.manager.operate;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.operate.BmPullNewBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.operate.BmPullNewEdit;
import com.mini.pojo.model.query.operate.BmPullNewQuery;
import com.mini.pojo.model.request.operate.BmPullNewRequest;
import com.mini.pojo.model.vo.operate.BmPullNewVo;
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
 * 拉新统一汇总表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Tag(name = "拉新管理", description = "拉新管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-pull-new")
@RequiredArgsConstructor
public class BmPullNewController {

    private final BmPullNewBiz bmPullNewBiz;

    @Operation(summary = "拉新分页")
    @GetMapping("/page")
    public Restful<IPage<BmPullNewVo>> page(@ParameterObject BmPullNewQuery query) {
        return Restful.OBJECT(bmPullNewBiz.page(query)).build();
    }

    @Operation(summary = "拉新详情")
    @GetMapping("/detail/{pullId}")
    public Restful<BmPullNewVo> getDetailById(@PathVariable("pullId") Long id) {
        return Restful.OBJECT(bmPullNewBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增拉新信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmPullNewRequest request) {
        bmPullNewBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除拉新信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmPullNewBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改拉新信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmPullNewEdit edit) {
        bmPullNewBiz.update(edit);
        return Restful.SUCCESS().build();
    }
}
