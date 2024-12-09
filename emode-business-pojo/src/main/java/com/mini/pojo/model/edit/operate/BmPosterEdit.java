package com.mini.pojo.model.edit.operate;

import com.mini.common.enums.str.PosterType;
import com.mini.common.enums.str.YesOrNo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 海报统一管理表
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPosterEdit {

    @NotNull(message = "主键 id 不可为空")
    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "图片id")
    private Long posterFileId;

    @Schema(title = "图片地址")
    private String posterUrl;

    @Schema(title = "（线下首页推荐海报）（线下运营宣传）（小程序首页）（小程序课程）（家校一体推广）")
    private PosterType posterType;

    @Schema(title = "海报状态、使用、未使用")
    private YesOrNo posterStatus;

    @Schema(title = "绘画人")
    private String posterOptName;

}
