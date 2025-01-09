package com.mini.pojo.model.dto.org;

import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
public class BmStuClassHourDataDTO {

    private Long id;

    @Schema(title = "课时类型")
    private CourseType classHourType;

    @Schema(title = "课时默认乘 100 计算逻辑")
    private Long classHour;
}
