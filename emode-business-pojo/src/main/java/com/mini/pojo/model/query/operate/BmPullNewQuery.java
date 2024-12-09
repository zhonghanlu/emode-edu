package com.mini.pojo.model.query.operate;

import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 拉新统一汇总表
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPullNewQuery extends PageQuery {

    @Parameter(description = "拉新人姓名")
    private String sourcePatriarchName;

    @Parameter(description = "邀请码")
    private String invitationCode;

    @Parameter(description = "被拉新人姓名")
    private String newPatriarchName;

}
