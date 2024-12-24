package com.mini.pojo.model.vo.course;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.enums.str.ProductType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author : zhl
 * @Date: 2024/12/19 21:49
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmFailHandlerClassVo {

    @Schema(name = "学生 id")
    private Long stuId;

    @Schema(name = "学生姓名")
    private String stuName;

    @Schema(title = "意向上课时间")
    private IntentionCurTime intentionCurTime;

    @Schema(name = "课程类型")
    private CourseType curType;

    @Schema(name = "课程归属类型 长期 短期")
    private ProductType productType;

    @Schema(name = "未能分班原因")
    private String errorReason;

}
