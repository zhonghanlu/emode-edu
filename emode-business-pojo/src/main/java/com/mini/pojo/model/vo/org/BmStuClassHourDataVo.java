package com.mini.pojo.model.vo.org;

import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
public class BmStuClassHourDataVo {

    @Schema(title = "课时id")
    private Long id;

    @Schema(title = "课时类型")
    private CourseType classHourType;

    @Schema(title = "课时默认乘 10000 计算逻辑")
    private Long classHour;
}
