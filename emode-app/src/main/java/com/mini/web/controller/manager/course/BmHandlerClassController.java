package com.mini.web.controller.manager.course;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.course.BmHandlerClassBiz;
import com.mini.common.annotation.RateLimiter;
import com.mini.common.enums.LimitType;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.course.BmHandlerClassEdit;
import com.mini.pojo.model.query.course.BmHandlerClassQuery;
import com.mini.pojo.model.request.course.BmPlacementClassRequest;
import com.mini.pojo.model.request.course.BmPlacementConfirmedClassRequest;
import com.mini.pojo.model.vo.course.BmHandlerClassResultVo;
import com.mini.pojo.model.vo.course.BmHandlerClassVo;
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
 * 待分班数据表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Tag(name = "待分班管理", description = "待分班管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-handler-class")
@RequiredArgsConstructor
public class BmHandlerClassController {

    private final BmHandlerClassBiz bmHandlerClassBiz;

    @Operation(summary = "待分班分页")
    @GetMapping("/page")
    public Restful<IPage<BmHandlerClassVo>> page(@ParameterObject BmHandlerClassQuery query) {
        return Restful.OBJECT(bmHandlerClassBiz.page(query)).build();
    }

    @Operation(summary = "待分班详情")
    @GetMapping("/detail/{handlerId}")
    public Restful<BmHandlerClassVo> getDetailById(@PathVariable("handlerId") Long id) {
        return Restful.OBJECT(bmHandlerClassBiz.getEntityById(id)).build();
    }

//    @Operation(summary = "新增待分班信息")
//    @PostMapping("/add")
//    public Restful<Void> insert(@RequestBody @Valid BmHandlerClassRequest request) {
//        bmHandlerClassBiz.insert(request);
//        return Restful.SUCCESS().build();
//    }

    @Operation(summary = "删除待分班信息", hidden = true)
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        bmHandlerClassBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改待分班信息", hidden = true)
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmHandlerClassEdit edit) {
        bmHandlerClassBiz.update(edit);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "一键分班")
    @RateLimiter(time = 1, count = 1, limitType = LimitType.IP)
    @PostMapping("/placement-class")
    public Restful<BmHandlerClassResultVo> placementClass(@RequestBody @Valid BmPlacementClassRequest request) {
        return Restful.OBJECT(bmHandlerClassBiz.placementClass(request)).build();
    }

    @Operation(summary = "一键确认分班")
    @RateLimiter(time = 1, count = 1, limitType = LimitType.IP)
    @PostMapping("/placement-confirmed-class")
    public Restful<Void> placementConfirmedClass(@RequestBody @Valid List<BmPlacementConfirmedClassRequest> request) {
        bmHandlerClassBiz.placementConfirmedClass(request);
        return Restful.SUCCESS().build();
    }
}
