package com.mini.web.controller.manager.operate;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 意见箱表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Tag(name = "意见箱管理", description = "意见箱管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-idea")
@RequiredArgsConstructor
public class BmIdeaController {

}
