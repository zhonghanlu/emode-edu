package com.mini.web.controller.manager;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.BmClassGradeBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.BmClassGradeEdit;
import com.mini.pojo.model.query.BmClassGradeQuery;
import com.mini.pojo.model.request.BmClassGradeRequest;
import com.mini.pojo.model.vo.BmClassGradeVo;
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
 * 班级数据表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Tag(name = "班级管理", description = "班级管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-class-grade")
@RequiredArgsConstructor
public class BmClassGradeController {

    private final BmClassGradeBiz bmClassGradeBiz;

    @Operation(summary = "班级分页")
    @GetMapping("/page")
    public Restful<IPage<BmClassGradeVo>> page(@ParameterObject BmClassGradeQuery query) {
        return Restful.OBJECT(bmClassGradeBiz.page(query)).build();
    }

    @Operation(summary = "班级详情")
    @GetMapping("/detail/{orgId}")
    public Restful<BmClassGradeVo> getDetailById(@PathVariable("orgId") Long id) {
        return Restful.OBJECT(bmClassGradeBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增班级信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmClassGradeRequest request) {
        bmClassGradeBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除教师信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmClassGradeBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改班级信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmClassGradeEdit edit) {
        bmClassGradeBiz.update(edit);
        return Restful.SUCCESS().build();
    }

}
