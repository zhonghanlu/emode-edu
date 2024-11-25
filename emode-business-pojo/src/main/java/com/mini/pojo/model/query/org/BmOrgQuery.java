package com.mini.pojo.model.query.org;

import com.mini.common.enums.str.YesOrNo;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author zhl
 * @create 2024/11/12 16:57
 */
@Schema(description = "机构查询")
@Data
@EqualsAndHashCode(callSuper = true)
public class BmOrgQuery extends PageQuery {
    /**
     * 机构名称
     */
    @Parameter(description = "机构名称")
    private String orgName;

    /**
     * 机构状态 是否地图注册
     */
    @Parameter(description = "机构状态,是否地图注册")
    private YesOrNo orgStatus;

}
