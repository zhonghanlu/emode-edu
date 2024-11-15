package com.mini.pojo.model.query;

import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 家长表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "家长查询")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatriarchQuery extends PageQuery {

    @Parameter(description = "家长姓名")
    private String patName;

    @Parameter(description = "家长手机号")
    private String patIphone;
}
