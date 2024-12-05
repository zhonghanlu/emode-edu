package com.mini.web.controller.manager.edu;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.edu.BmTutorTeacherBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.edu.BmTutorTeacherEdit;
import com.mini.pojo.model.query.edu.BmTutorTeacherQuery;
import com.mini.pojo.model.request.edu.BmTutorTeacherRequest;
import com.mini.pojo.model.vo.edu.BmTutorTeacherVo;
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
 * 家教老师 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Tag(name = "家教老师管理", description = "家教老师管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-tutor-teacher")
@RequiredArgsConstructor
public class BmTutorTeacherController {

    private final BmTutorTeacherBiz bmTutorTeacherBiz;

    @Operation(summary = "家教老师分页")
    @GetMapping("/page")
    public Restful<IPage<BmTutorTeacherVo>> page(@ParameterObject BmTutorTeacherQuery query) {
        return Restful.OBJECT(bmTutorTeacherBiz.page(query)).build();
    }

    @Operation(summary = "家教老师详情")
    @GetMapping("/detail/{teaId}")
    public Restful<BmTutorTeacherVo> getDetailById(@PathVariable("teaId") Long id) {
        return Restful.OBJECT(bmTutorTeacherBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增家教老师信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmTutorTeacherRequest request) {
        bmTutorTeacherBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除家教老师信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmTutorTeacherBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改家教老师信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmTutorTeacherEdit edit) {
        bmTutorTeacherBiz.update(edit);
        return Restful.SUCCESS().build();
    }
}
