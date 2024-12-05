package com.mini.pojo.model.dto.operate;

import com.mini.common.enums.str.IdeaType;
import io.swagger.v3.oas.annotations.media.Schema;
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
public class BmIdeaDTO {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "意见类型")
    private IdeaType ideaType;

    @Schema(title = "意见内容")
    private String ideaContent;
}
