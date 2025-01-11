package com.mini.web.controller.manager.course;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.course.BmRepairCourseBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.course.BmRepairCourseEdit;
import com.mini.pojo.model.query.course.BmRepairCourseQuery;
import com.mini.pojo.model.request.course.BmRepairCourseFinishRequest;
import com.mini.pojo.model.request.course.BmRepairCourseRequest;
import com.mini.pojo.model.request.course.BmRepairCourseUploadFileRequest;
import com.mini.pojo.model.vo.course.BmRepairCourseVo;
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
 * 补课数据表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Tag(name = "补课管理", description = "补课管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-repair-course")
@RequiredArgsConstructor
public class BmRepairCourseController {

    private final BmRepairCourseBiz bmRepairCourseBiz;

    @Operation(summary = "补课分页")
    @GetMapping("/page")
    public Restful<IPage<BmRepairCourseVo>> page(@ParameterObject BmRepairCourseQuery query) {
        return Restful.OBJECT(bmRepairCourseBiz.page(query)).build();
    }

    @Operation(summary = "补课详情")
    @GetMapping("/detail/{repairId}")
    public Restful<BmRepairCourseVo> getDetailById(@PathVariable("repairId") Long id) {
        return Restful.OBJECT(bmRepairCourseBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增补课信息-仅支持从补课数据获取")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmRepairCourseRequest request) {
        bmRepairCourseBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除补课信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmRepairCourseBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改补课信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmRepairCourseEdit edit) {
        bmRepairCourseBiz.update(edit);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "上传补课讲义与作业")
    @PostMapping("/upload-file")
    public Restful<Void> uploadFile(@RequestBody @Valid BmRepairCourseUploadFileRequest request) {
        bmRepairCourseBiz.uploadFile(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "补课结束")
    @PostMapping("/finish")
    public Restful<Void> finish(@RequestBody @Valid BmRepairCourseFinishRequest request) {
        bmRepairCourseBiz.finish(request);
        return Restful.SUCCESS().build();
    }
}
