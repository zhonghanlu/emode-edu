package com.mini.pojo.model.request.course;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.ProductType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * <p>
 * 待分班数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmHandlerClassRequest {

    /**
     * 待分班数据 id
     */
    @Schema(name = "待分班数据 id")
    private List<Long> handlerIdList;

    @Schema(name = "课程类型")
    private CourseType curType;

    @Schema(name = "课程归属类型 长期 短期")
    private ProductType productType;

}
