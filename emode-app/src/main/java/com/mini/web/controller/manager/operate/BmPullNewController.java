package com.mini.web.controller.manager.operate;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 拉新统一汇总表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Tag(name = "拉新管理", description = "拉新管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-pull-new")
@RequiredArgsConstructor
public class BmPullNewController {

}
