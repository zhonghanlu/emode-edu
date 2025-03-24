package com.mini.web.controller.app.business;

import com.mini.base.model.vo.SysNoticeVo;
import com.mini.biz.app.business.AppHomeBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.request.business.BmPatAddStuRequest;
import com.mini.pojo.model.vo.business.BmPatriarchStuInfoVo;
import com.mini.pojo.model.vo.operate.BmPosterVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * @author zhl
 * @create 2025/3/18 14:40
 */
@Tag(description = "首页", name = "首页")
@Slf4j
@Validated
@RestController
@RequestMapping("/app/home")
@RequiredArgsConstructor
public class AppHomeController {

    private final AppHomeBiz appHomeBiz;

    @Operation(summary = "首页海报")
    @GetMapping("/poster")
    public Restful<List<BmPosterVo>> homePoster() {
        return Restful.OBJECT(appHomeBiz.homePoster()).build();
    }

    @Operation(summary = "首页最新一条消息")
    @GetMapping("/notice")
    public Restful<SysNoticeVo> homeNotice() {
        return Restful.OBJECT(appHomeBiz.homeNotice()).build();
    }

    @Operation(summary = "添加我的孩子")
    @PostMapping("/add-child")
    public Restful<Void> addChild(@RequestBody() @Valid BmPatAddStuRequest request) {
        appHomeBiz.addMyChild(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "我的孩子信息-可能多个")
    @GetMapping("/child-info")
    public Restful<List<BmPatriarchStuInfoVo>> childInfo() {
        return Restful.OBJECT(appHomeBiz.myChildInfo()).build();
    }


}

