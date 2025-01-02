package com.mini.web.controller.manager.course;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.course.BmCourseBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.course.*;
import com.mini.pojo.model.query.course.BmCourseQuery;
import com.mini.pojo.model.request.course.BmCourseRequest;
import com.mini.pojo.model.vo.course.BmCourseVo;
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
    @GetMapping("/detail/{courseId}")
    public Restful<BmCourseVo> getDetailById(@PathVariable("courseId") Long id) {
        return Restful.OBJECT(bmCourseBiz.getEntityById(id)).build();
    }

    @Operation(summary = "新增课程信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmCourseRequest request) {
        bmCourseBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除课程信息")
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

    @Operation(summary = "学生课程签到")
    @PostMapping("/stu-sign-in")
    public Restful<Void> stuSignIn(@RequestBody @Valid BmCourseStuSignEdit edit) {
        bmCourseBiz.stuSignIn(edit);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "学生课中图片")
    @PostMapping("/stu-class-pic")
    public Restful<Void> stuClassPic(@RequestBody @Valid BmCourseStuClassPicEdit edit) {
        bmCourseBiz.stuClassPic(edit);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "课堂讲义与作业")
    @PostMapping("/stu-class-notes")
    public Restful<Void> stuClassNotes(@RequestBody @Valid BmCourseStuClassNotesEdit edit) {
        bmCourseBiz.stuClassNotes(edit);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "课程结束")
    @PostMapping("/finish")
    public Restful<Void> finish(@RequestBody @Valid BmCourseFinishEdit edit) {
        bmCourseBiz.finish(edit);
        return Restful.SUCCESS().build();
    }


}
