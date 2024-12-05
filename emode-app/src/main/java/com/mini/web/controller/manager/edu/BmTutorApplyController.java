package com.mini.web.controller.manager.edu;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.edu.BmTutorApplyBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.edu.BmTutorApplyEdit;
import com.mini.pojo.model.query.edu.BmTutorApplyQuery;
import com.mini.pojo.model.request.edu.BmTutorApplyRequest;
import com.mini.pojo.model.vo.edu.BmTutorApplyVo;
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
 * 家教申请 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Tag(name = "家教申请管理", description = "家教申请管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-tutor-apply")
@RequiredArgsConstructor
public class BmTutorApplyController {

    private final BmTutorApplyBiz bmTutorApplyBiz;

    @Operation(summary = "家教申请分页")
    @GetMapping("/page")
    public Restful<IPage<BmTutorApplyVo>> page(@ParameterObject BmTutorApplyQuery query) {
        return Restful.OBJECT(bmTutorApplyBiz.page(query)).build();
    }

    @Operation(summary = "家教申请详情")
    @GetMapping("/detail/{applyId}")
    public Restful<BmTutorApplyVo> getDetailById(@PathVariable("applyId") Long id) {
        return Restful.OBJECT(bmTutorApplyBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增家教申请信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmTutorApplyRequest request) {
        bmTutorApplyBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除家教申请信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmTutorApplyBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改家教申请信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmTutorApplyEdit edit) {
        bmTutorApplyBiz.update(edit);
        return Restful.SUCCESS().build();
    }
}
