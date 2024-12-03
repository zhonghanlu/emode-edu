package com.mini.web.controller.manager.course;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.course.BmLackCourseBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.course.BmLackCourseEdit;
import com.mini.pojo.model.query.course.BmLackCourseQuery;
import com.mini.pojo.model.request.course.BmLackCourseRequest;
import com.mini.pojo.model.vo.course.BmLackCourseVo;
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
 * 缺课数据表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Tag(name = "缺课管理", description = "缺课管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-lack-course")
@RequiredArgsConstructor
public class BmLackCourseController {

    private final BmLackCourseBiz bmLackCourseBiz;

    @Operation(summary = "缺课分页")
    @GetMapping("/page")
    public Restful<IPage<BmLackCourseVo>> page(@ParameterObject BmLackCourseQuery query) {
        return Restful.OBJECT(bmLackCourseBiz.page(query)).build();
    }

    @Operation(summary = "缺课详情")
    @GetMapping("/detail/{lackId}")
    public Restful<BmLackCourseVo> getDetailById(@PathVariable("lackId") Long id) {
        return Restful.OBJECT(bmLackCourseBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增缺课信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmLackCourseRequest request) {
        bmLackCourseBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除缺课信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmLackCourseBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改缺课信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmLackCourseEdit edit) {
        bmLackCourseBiz.update(edit);
        return Restful.SUCCESS().build();
    }
}
