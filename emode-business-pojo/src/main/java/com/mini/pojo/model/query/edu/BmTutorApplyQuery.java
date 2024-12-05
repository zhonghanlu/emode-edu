package com.mini.pojo.model.query.edu;

import com.mini.common.enums.str.ApplyStatus;
import com.mini.common.enums.str.CourseType;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 家教申请
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTutorApplyQuery extends PageQuery {

    @Parameter(description = "申请人姓名")
    private String applyName;

    @Parameter(description = "申请科目")
    private CourseType applySubject;

    @Parameter(description = "申请时间")
    private String applyTime;

    @Parameter(description = "申请家教老师姓名")
    private String applyTutorTeaName;

    @Parameter(description = "申请状态")
    private ApplyStatus applyStatus;
}
