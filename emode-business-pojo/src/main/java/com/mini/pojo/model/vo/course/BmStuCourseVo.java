package com.mini.pojo.model.vo.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author zhl
 * @create 2025/2/14 17:19
 */
@Data
public class BmStuCourseVo {

    @Schema(title = "学生id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;
}
