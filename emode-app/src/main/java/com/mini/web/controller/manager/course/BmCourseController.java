package com.mini.web.controller.manager.course;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.BmCourseBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.BmCourseEdit;
import com.mini.pojo.model.query.BmCourseQuery;
import com.mini.pojo.model.request.BmCourseRequest;
import com.mini.pojo.model.vo.BmCourseVo;
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
 * 课程表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Tag(name = "课程管理", description = "课程表管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-course")
@RequiredArgsConstructor
public class BmCourseController {

    private final BmCourseBiz bmCourseBiz;

    @Operation(summary = "课程分页")
    @GetMapping("/page")
    public Restful<IPage<BmCourseVo>> page(@ParameterObject BmCourseQuery query) {
        return Restful.OBJECT(bmCourseBiz.page(query)).build();
    }

    @Operation(summary = "课程详情")
    @GetMapping("/detail/{orgId}")
    public Restful<BmCourseVo> getDetailById(@PathVariable("orgId") Long id) {
        return Restful.OBJECT(bmCourseBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增课程信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmCourseRequest request) {
        bmCourseBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除教师信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmCourseBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改课程信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmCourseEdit edit) {
        bmCourseBiz.update(edit);
        return Restful.SUCCESS().build();
    }

}
