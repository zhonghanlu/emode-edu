package com.mini.pojo.model.query.course;

import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 班级数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "班级数据表")
@Data
@EqualsAndHashCode(callSuper = true)
public class BmClassGradeQuery extends PageQuery {

    @Parameter(description = "班级名称")
    private String classGradeName;

    @Parameter(description = "教师名称")
    private String teaName;

    @Parameter(description = "教室名")
    private String classroomName;
}
