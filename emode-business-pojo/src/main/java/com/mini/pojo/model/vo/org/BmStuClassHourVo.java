package com.mini.pojo.model.vo.org;

import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author zhl
 * @create 2025/1/7 10:25
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStuClassHourVo {

    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "课时类型")
    private CourseType classHourType;

    @Schema(title = "课时默认乘 100 计算逻辑")
    private Long classHour;
}
