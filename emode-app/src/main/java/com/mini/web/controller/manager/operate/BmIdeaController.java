package com.mini.web.controller.manager.operate;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.operate.BmIdeaBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.operate.BmIdeaEdit;
import com.mini.pojo.model.query.operate.BmIdeaQuery;
import com.mini.pojo.model.request.operate.BmIdeaRequest;
import com.mini.pojo.model.vo.operate.BmIdeaVo;
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
 * 意见箱表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Tag(name = "意见箱管理", description = "意见箱管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-idea")
@RequiredArgsConstructor
public class BmIdeaController {

    private final BmIdeaBiz bmIdeaBiz;

    @Operation(summary = "意见箱分页")
    @GetMapping("/page")
    public Restful<IPage<BmIdeaVo>> page(@ParameterObject BmIdeaQuery query) {
        return Restful.OBJECT(bmIdeaBiz.page(query)).build();
    }

    @Operation(summary = "意见箱详情")
    @GetMapping("/detail/{ideaId}")
    public Restful<BmIdeaVo> getDetailById(@PathVariable("ideaId") Long id) {
        return Restful.OBJECT(bmIdeaBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增意见箱信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmIdeaRequest request) {
        bmIdeaBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除意见箱信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmIdeaBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改意见箱信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmIdeaEdit edit) {
        bmIdeaBiz.update(edit);
        return Restful.SUCCESS().build();
    }

}
