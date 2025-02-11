package com.mini.web.controller.manager.org;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.biz.manager.org.BmStudentBiz;
import com.mini.common.annotation.RateLimiter;
import com.mini.common.constant.RedisConstant;
import com.mini.common.enums.LimitType;
import com.mini.common.utils.redis.RedisUtils;
import com.mini.common.utils.webmvc.Restful;
import com.mini.manager.service.BmStudentConstantService;
import com.mini.pojo.entity.org.BmStudentConstant;
import com.mini.pojo.model.edit.org.BmStudentEdit;
import com.mini.pojo.model.query.org.BmStudentQuery;
import com.mini.pojo.model.request.org.BmStuHourConvertRequest;
import com.mini.pojo.model.request.org.BmStudentRequest;
import com.mini.pojo.model.vo.org.BmStuClassTypeHourVo;
import com.mini.pojo.model.vo.org.BmStudentConstantVo;
import com.mini.pojo.model.vo.org.BmStudentPatInfoVo;
import com.mini.pojo.model.vo.org.BmStudentVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.Duration;
import java.util.List;

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

    private final BmStudentConstantService bmStudentConstantService;

    @Operation(summary = "学生分页")
    @GetMapping("/page")
    public Restful<IPage<BmStudentVo>> page(@ParameterObject BmStudentQuery query) {
        return Restful.OBJECT(studentBiz.page(query)).build();
    }

    @Operation(summary = "学生详情")
    @GetMapping("/detail/{stuId}")
    public Restful<BmStudentVo> getDetailById(@PathVariable("stuId") Long id) {
        return Restful.OBJECT(studentBiz.getEntityById(id)).build();
    }

    @Operation(summary = "查看学生家长信息")
    @GetMapping("/patriarch-info/{stuId}")
    public Restful<BmStudentPatInfoVo> patriarchInfo(@PathVariable("stuId") Long id) {
        return Restful.OBJECT(studentBiz.patriarchInfo(id)).build();
    }

    @Operation(summary = "获取学生所有课程类型与对应课时")
    @GetMapping("/stu—class-type-hour/{stuId}")
    public Restful<BmStuClassTypeHourVo> stuClassTypeHour(@PathVariable("stuId") Long id) {
        return Restful.OBJECT(studentBiz.stuClassTypeHour(id)).build();
    }

    @Operation(summary = "学生课时全量转换")
    @PostMapping("/stu-hour-convert")
    public Restful<Void> stuHourConvert(@RequestBody @Valid BmStuHourConvertRequest request) {
        studentBiz.stuHourConvert(request);
        return Restful.SUCCESS().build();
    }

    @RateLimiter(time = 1, count = 1, limitType = LimitType.IP)
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

    @Operation(summary = "学校 OR 年级 列表")
    @GetMapping("/school-or-grade")
    public Restful<List<BmStudentConstantVo>> schoolOrGrade(@RequestParam("type") String type) {
        // 默认根据类型取缓存
        List<BmStudentConstant> bmStudentConstantList = RedisUtils.getCacheList(RedisConstant.SCHOOL_OR_GRADE + type + RedisConstant.PLACEHOLDER);

        if (CollectionUtils.isEmpty(bmStudentConstantList)) {
            LambdaQueryWrapper<BmStudentConstant> wrapper = Wrappers.lambdaQuery(BmStudentConstant.class);
            wrapper.eq(BmStudentConstant::getType, type);
            bmStudentConstantList = bmStudentConstantService.list(wrapper);
            if (CollectionUtils.isNotEmpty(bmStudentConstantList)) {
                RedisUtils.setCacheObject(RedisConstant.SCHOOL_OR_GRADE + type + RedisConstant.PLACEHOLDER, bmStudentConstantList, Duration.ofDays(7));
            }
        }

        return Restful.OBJECT(BeanUtil.copyToList(bmStudentConstantList, BmStudentConstantVo.class)).build();
    }

}
