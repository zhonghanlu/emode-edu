package com.mini.web.controller.manager;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

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

}
