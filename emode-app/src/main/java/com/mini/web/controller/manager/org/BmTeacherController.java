package com.mini.web.controller.manager.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.BmTeacherBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.org.BmTeacherEdit;
import com.mini.pojo.model.query.org.BmTeacherQuery;
import com.mini.pojo.model.request.org.BmTeacherRequest;
import com.mini.pojo.model.vo.org.BmTeacherVo;
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
 * 老师表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Tag(name = "教师管理", description = "教师管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-teacher")
@RequiredArgsConstructor
public class BmTeacherController {

    private final BmTeacherBiz teacherBiz;

    @Operation(summary = "教师分页")
    @GetMapping("/page")
    public Restful<IPage<BmTeacherVo>> page(@ParameterObject BmTeacherQuery query) {
        return Restful.OBJECT(teacherBiz.page(query)).build();
    }

    @Operation(summary = "教师详情")
    @GetMapping("/detail/{orgId}")
    public Restful<BmTeacherVo> getDetailById(@PathVariable("orgId") Long id) {
        return Restful.OBJECT(teacherBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增教师信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmTeacherRequest request) {
        teacherBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除教师信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        teacherBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改教师信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmTeacherEdit edit) {
        teacherBiz.update(edit);
        return Restful.SUCCESS().build();
    }

}
