package com.mini.web.controller.manager.course;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.course.BmCourseScheduleBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.course.BmCourseScheduleEdit;
import com.mini.pojo.model.query.course.BmCourseScheduleQuery;
import com.mini.pojo.model.request.course.BmCourseScheduleRequest;
import com.mini.pojo.model.vo.course.BmCourseScheduleVo;
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
 * 课表主表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Tag(name = "课程表管理", description = "课程表管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-course-schedule")
@RequiredArgsConstructor
public class BmCourseScheduleController {

    private final BmCourseScheduleBiz bmCourseScheduleBiz;

    @Operation(summary = "课程表分页")
    @GetMapping("/page")
    public Restful<IPage<BmCourseScheduleVo>> page(@ParameterObject BmCourseScheduleQuery query) {
        return Restful.OBJECT(bmCourseScheduleBiz.page(query)).build();
    }

    @Operation(summary = "课程表详情")
    @GetMapping("/detail/{scheduleId}")
    public Restful<BmCourseScheduleVo> getDetailById(@PathVariable("scheduleId") Long id) {
        return Restful.OBJECT(bmCourseScheduleBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增课程表信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmCourseScheduleRequest request) {
        bmCourseScheduleBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除课程表信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmCourseScheduleBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改课程表信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmCourseScheduleEdit edit) {
        bmCourseScheduleBiz.update(edit);
        return Restful.SUCCESS().build();
    }
}
