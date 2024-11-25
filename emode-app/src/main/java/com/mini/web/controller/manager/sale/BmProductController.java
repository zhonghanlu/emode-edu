package com.mini.web.controller.manager.sale;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 课程商品表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Tag(name = "课程商品管理", description = "订课程商品管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-product")
@RequiredArgsConstructor
public class BmProductController {

}
