package com.mini.pojo.model.query.edu;

import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 家教老师
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTutorTeacherQuery extends PageQuery {

    @Parameter(description = "家教老师名称")
    private String teaName;

    @Parameter(description = "授课范围 python 、 c++等")
    private String giveClassType;

    @Parameter(description = "空闲时间")
    private String leisureTime;

    @Parameter(description = "教师详细介绍")
    private String tutorDetail;

}
