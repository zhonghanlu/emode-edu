package com.mini.web.controller.app.business;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.app.business.AppCourseBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.query.sale.BmProductAppQuery;
import com.mini.pojo.model.request.wx.*;
import com.mini.pojo.model.vo.operate.BmPosterVo;
import com.mini.pojo.model.vo.sale.BmProductAppDetailVo;
import com.mini.pojo.model.vo.sale.BmProductAppVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author zhl
 * @create 2025/3/18 16:05
 */
@Tag(description = "课程", name = "课程")
@Slf4j
@Validated
@RestController
@RequestMapping("/app/course")
@RequiredArgsConstructor
public class AppCourseController {

    private final AppCourseBiz appCourseBiz;

    @Operation(summary = "课程海报")
    @GetMapping("/poster")
    public Restful<List<BmPosterVo>> coursePoster() {
        return Restful.OBJECT(appCourseBiz.coursePoster()).build();
    }

    @Operation(summary = "课程查询")
    @GetMapping("/page")
    public Restful<IPage<BmProductAppVo>> courseInfo(BmProductAppQuery query) {
        return Restful.OBJECT(appCourseBiz.courseInfo(query)).build();
    }

    @Operation(summary = "课程详情查询")
    @GetMapping("/detail/{productId}")
    public Restful<BmProductAppDetailVo> productAppDetailVo(@PathVariable("productId") Long productId) {
        return Restful.OBJECT(appCourseBiz.productAppDetailVo(productId)).build();
    }

    @Operation(summary = "课程支付")
    @PostMapping("/wx-pay")
    public Restful<BmWxPayResponse> wxPay(BmWxPayRequest request) {
        return Restful.OBJECT(appCourseBiz.wxPay(request)).build();
    }

    @Operation(summary = "课程支付回调")
    @PostMapping("/wx-pay-notify")
    public Restful<Void> wxPayNotify(BmWxPatNotifyRequest request) {
        appCourseBiz.wxPayNotify(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "课程支付查询")
    @PostMapping("/wx-pay-query")
    public Restful<BmWxPayQueryResponse> wxPayQuery(BmWxPayQueryRequest request) {
        return Restful.OBJECT(appCourseBiz.wxPayQuery(request)).build();
    }

}
