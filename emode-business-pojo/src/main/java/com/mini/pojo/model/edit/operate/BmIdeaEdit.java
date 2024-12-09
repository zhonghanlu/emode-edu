package com.mini.pojo.model.edit.operate;

import com.mini.common.enums.str.IdeaType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

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
public class BmIdeaEdit {

    @NotNull(message = "主键id 不可为空")
    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "意见类型")
    private IdeaType ideaType;

    @Schema(title = "意见内容")
    private String ideaContent;
}
