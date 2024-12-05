package com.mini.pojo.model.query.operate;

import com.mini.common.enums.str.PosterType;
import com.mini.common.enums.str.YesOrNo;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

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
public class BmPosterQuery extends PageQuery {

    @Parameter(description = "（线下首页推荐海报）（线下运营宣传）（小程序首页）（小程序课程）（家校一体推广）")
    private PosterType posterType;

    @Parameter(description = "海报状态、使用、未使用")
    private YesOrNo posterStatus;

    @Parameter(description = "绘画人")
    private String posterOptName;

}
