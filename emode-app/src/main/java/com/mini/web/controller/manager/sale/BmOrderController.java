package com.mini.web.controller.manager.sale;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 订单表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Tag(name = "订单管理", description = "订单管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-order")
@RequiredArgsConstructor
public class BmOrderController {

}
