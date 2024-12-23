package com.mini.pojo.model.request.course;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.ProductType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
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
    @NotNull(message = "待分班数据 id 不能为空")
    @Schema(title = "待分班数据 id")
    private List<Long> handlerIdList;

    @NotNull(message = "课程类型不可为空")
    @Schema(title = "课程类型")
    private CourseType curType;

    @NotNull(message = "课程归属类型不能为空")
    @Schema(title = "课程归属类型 长期 短期")
    private ProductType productType;

}
