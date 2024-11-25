package com.mini.web.controller.manager.sale;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 补单（便于线下收款） 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Tag(name = "订单(补单)管理", description = "订单(补单)管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-patch-order")
@RequiredArgsConstructor
public class BmPatchOrderController {

}
