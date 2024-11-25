package com.mini.web.controller.manager.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.BmStudentBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.BmStudentEdit;
import com.mini.pojo.model.query.BmStudentQuery;
import com.mini.pojo.model.request.BmStudentRequest;
import com.mini.pojo.model.vo.BmStudentVo;
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
 * 学生表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Tag(name = "学生管理", description = "学生管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-student")
@RequiredArgsConstructor
public class BmStudentController {

    private final BmStudentBiz studentBiz;

    @Operation(summary = "学生分页")
    @GetMapping("/page")
    public Restful<IPage<BmStudentVo>> page(@ParameterObject BmStudentQuery query) {
        return Restful.OBJECT(studentBiz.page(query)).build();
    }

    @Operation(summary = "学生详情")
    @GetMapping("/detail/{orgId}")
    public Restful<BmStudentVo> getDetailById(@PathVariable("orgId") Long id) {
        return Restful.OBJECT(studentBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增学生信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmStudentRequest request) {
        studentBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除学生信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        studentBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改学生信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmStudentEdit edit) {
        studentBiz.update(edit);
        return Restful.SUCCESS().build();
    }

}
