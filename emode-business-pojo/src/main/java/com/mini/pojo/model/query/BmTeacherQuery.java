package com.mini.pojo.model.query;

import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 老师表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "教师查询")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTeacherQuery extends PageQuery {

    @Parameter(description = "教师名称")
    private String teaName;

    @Parameter(description = "教师手机号")
    private String teaIphone;

}
