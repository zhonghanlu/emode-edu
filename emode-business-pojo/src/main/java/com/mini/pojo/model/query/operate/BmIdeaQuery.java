package com.mini.pojo.model.query.operate;

import com.mini.common.enums.str.IdeaType;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 意见箱表
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmIdeaQuery extends PageQuery {

    @Parameter(description = "意见类型")
    private IdeaType ideaType;
}
