package com.mini.web.controller.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.BmOrgBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.BmOrgEdit;
import com.mini.pojo.model.query.BmOrgQuery;
import com.mini.pojo.model.request.BmOrgRequest;
import com.mini.pojo.model.vo.BmOrgVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * @author zhl
 * @create 2024/11/12 17:14
 */
@Tag(name = "机构管理", description = "机构管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/org")
@RequiredArgsConstructor
public class BmOrgController {

    private final BmOrgBiz bmOrgBiz;

    @Operation(summary = "机构分页")
    @GetMapping("/page")
    public Restful<IPage<BmOrgVo>> rolePage(@ParameterObject BmOrgQuery query) {
        return Restful.OBJECT(bmOrgBiz.page(query)).build();
    }

    @Operation(summary = "机构详情")
    @GetMapping("/detail/{orgId}")
    public Restful<BmOrgVo> getRoleById(@PathVariable("orgId") Long id) {
        return Restful.OBJECT(bmOrgBiz.getBmOrgById(id)).build();
    }

    @Operation(summary = "新增机构信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmOrgRequest request) {
        bmOrgBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除机构信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmOrgBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改机构信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmOrgEdit edit) {
        bmOrgBiz.update(edit);
        return Restful.SUCCESS().build();
    }

}