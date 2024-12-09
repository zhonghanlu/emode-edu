package com.mini.web.controller.manager.operate;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.operate.BmPosterBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.operate.BmPosterEdit;
import com.mini.pojo.model.query.operate.BmPosterQuery;
import com.mini.pojo.model.request.operate.BmPosterRequest;
import com.mini.pojo.model.vo.operate.BmPosterVo;
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
 * 海报统一管理表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Tag(name = "海报管理", description = "海报管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-poster")
@RequiredArgsConstructor
public class BmPosterController {

    private final BmPosterBiz bmPosterBiz;

    @Operation(summary = "海报分页")
    @GetMapping("/page")
    public Restful<IPage<BmPosterVo>> page(@ParameterObject BmPosterQuery query) {
        return Restful.OBJECT(bmPosterBiz.page(query)).build();
    }

    @Operation(summary = "海报详情")
    @GetMapping("/detail/{posterId}")
    public Restful<BmPosterVo> getDetailById(@PathVariable("posterId") Long id) {
        return Restful.OBJECT(bmPosterBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增海报信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmPosterRequest request) {
        bmPosterBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除海报信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmPosterBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改海报信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmPosterEdit edit) {
        bmPosterBiz.update(edit);
        return Restful.SUCCESS().build();
    }
}
