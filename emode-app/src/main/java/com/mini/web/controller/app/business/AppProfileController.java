package com.mini.web.controller.app.business;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zhl
 * @create 2025/3/18 16:13
 */
@Tag(description = "个人中心", name = "个人中心")
@Slf4j
@Validated
@RestController
@RequestMapping("/app/profile")
@RequiredArgsConstructor
public class AppProfileController {
}
