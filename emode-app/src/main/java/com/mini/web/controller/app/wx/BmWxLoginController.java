package com.mini.web.controller.app.wx;

import com.mini.biz.app.wx.BmWxLoginBiz;
import com.mini.common.model.LoginModel;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.dto.wx.BmWxCode2SessionDTO;
import com.mini.pojo.model.request.wx.BmWxJsCodeRequest;
import com.mini.pojo.model.request.wx.BmWxLoginRequest;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * @author zhl
 * @create 2025/2/26 16:27
 */
@Tag(name = "微信登录", description = "微信登录")
@RestController
@Validated
@RequiredArgsConstructor
@RequestMapping("/wx")
public class BmWxLoginController {

    private final BmWxLoginBiz bmWxLoginBiz;

    @Operation(summary = "jsCode2Session")
    @PostMapping("/code-session")
    public Restful<BmWxCode2SessionDTO> code2Session(@RequestBody @Valid BmWxJsCodeRequest request) {
        return Restful.OBJECT(bmWxLoginBiz.jsCode2Session(request)).build();
    }

    @Operation(summary = "微信登录")
    @PostMapping("/login")
    public Restful<LoginModel> login(@RequestBody @Valid BmWxLoginRequest request) {
        return Restful.OBJECT(bmWxLoginBiz.login(request)).build();
    }

}

