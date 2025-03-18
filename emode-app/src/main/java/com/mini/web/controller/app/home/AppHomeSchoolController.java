package com.mini.web.controller.app.home;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zhl
 * @create 2025/3/18 16:08
 */
@Tag(description = "家校一体", name = "家校一体")
@Slf4j
@Validated
@RestController
@RequestMapping("/app/home-school")
@RequiredArgsConstructor
public class AppHomeSchoolController {
}
