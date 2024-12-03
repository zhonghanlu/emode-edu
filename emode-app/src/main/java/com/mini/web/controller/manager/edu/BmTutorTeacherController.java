package com.mini.web.controller.manager.edu;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 家教老师 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Tag(name = "家教老师管理", description = "家教老师管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-tutor-teacher")
@RequiredArgsConstructor
public class BmTutorTeacherController {

}
