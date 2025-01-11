package com.mini.web.controller.manager.course;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.course.BmClassGradeBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.course.BmClassGradeEdit;
import com.mini.pojo.model.query.course.BmClassGradeQuery;
import com.mini.pojo.model.request.course.BmClassGradeAddStuRequest;
import com.mini.pojo.model.request.course.BmClassGradeMoveOutRequest;
import com.mini.pojo.model.request.course.BmClassGradeMoveStuRequest;
import com.mini.pojo.model.request.course.BmClassGradeRequest;
import com.mini.pojo.model.vo.course.BmClassGradeStuVo;
import com.mini.pojo.model.vo.course.BmClassGradeVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 班级数据表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Tag(name = "班级管理", description = "班级管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-class-grade")
@RequiredArgsConstructor
public class BmClassGradeController {

    private final BmClassGradeBiz bmClassGradeBiz;

    @Operation(summary = "班级分页")
    @GetMapping("/page")
    public Restful<IPage<BmClassGradeVo>> page(@ParameterObject BmClassGradeQuery query) {
        return Restful.OBJECT(bmClassGradeBiz.page(query)).build();
    }

    @Operation(summary = "班级内学生信息详情")
    @GetMapping("/detail-stu/{gradeId}")
    public Restful<List<BmClassGradeStuVo>> getDetailForStuById(@PathVariable("gradeId") Long id) {
        return Restful.OBJECT(bmClassGradeBiz.getDetailForStuById(id)).build();
    }

    @Operation(summary = "相同类型移动学生数据")
    @PostMapping("/move-stu")
    public Restful<Void> moveStu(@RequestBody @Valid BmClassGradeMoveStuRequest request) {
        bmClassGradeBiz.moveStu(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "将学生移除班级")
    @PostMapping("/move-out")
    public Restful<Void> moveOut(@RequestBody @Valid BmClassGradeMoveOutRequest request) {
        bmClassGradeBiz.moveOut(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "班级新增人员数据")
    @PostMapping("/classGrade-add-stu")
    public Restful<Void> classGradeAddStu(@RequestBody @Valid BmClassGradeAddStuRequest request) {
        bmClassGradeBiz.classGradeAddStu(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "新增班级信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmClassGradeRequest request) {
        bmClassGradeBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除班级信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmClassGradeBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改班级信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmClassGradeEdit edit) {
        bmClassGradeBiz.update(edit);
        return Restful.SUCCESS().build();
    }

}
