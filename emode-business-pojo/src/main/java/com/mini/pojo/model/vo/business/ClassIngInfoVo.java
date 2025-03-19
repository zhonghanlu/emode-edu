package com.mini.pojo.model.vo.business;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author : zhl
 * @Date: 2025/3/19 21:58
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ClassIngInfoVo {

    @Schema(title = "课程学生图片id")
    private Long coursePicId;

    @Schema(title = "课程学生图片url")
    private String coursePicUrl;

}
