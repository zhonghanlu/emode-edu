package com.mini.pojo.model.request.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author zhl
 * @create 2025/1/7 15:10
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStuHourConvertRequest {

    @Schema(title = "学生id")
    private Long stuId;

}
