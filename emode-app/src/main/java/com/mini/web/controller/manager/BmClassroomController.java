package com.mini.web.controller.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.BmClassroomBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.BmClassroomEdit;
import com.mini.pojo.model.query.BmClassroomQuery;
import com.mini.pojo.model.request.BmClassroomRequest;
import com.mini.pojo.model.vo.BmClassroomVo;
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
 * 教室表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Tag(name = "教室管理", description = "教室管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-classroom")
@RequiredArgsConstructor
public class BmClassroomController {

    private final BmClassroomBiz classroomBiz;

    @Operation(summary = "教室分页")
    @GetMapping("/page")
    public Restful<IPage<BmClassroomVo>> page(@ParameterObject BmClassroomQuery query) {
        return Restful.OBJECT(classroomBiz.page(query)).build();
    }

    @Operation(summary = "教室详情")
    @GetMapping("/detail/{orgId}")
    public Restful<BmClassroomVo> getDetailById(@PathVariable("orgId") Long id) {
        return Restful.OBJECT(classroomBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增教室信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmClassroomRequest request) {
        classroomBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除教师信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        classroomBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改教室信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmClassroomEdit edit) {
        classroomBiz.update(edit);
        return Restful.SUCCESS().build();
    }

}
