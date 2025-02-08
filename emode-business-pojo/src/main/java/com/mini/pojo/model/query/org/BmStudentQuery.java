package com.mini.pojo.model.query.org;

import com.mini.common.enums.str.Gender;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 学生表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "学生查询")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStudentQuery extends PageQuery {

    @Parameter(description = "学生姓名")
    private String stuName;

    @Parameter(description = "学生性别")
    private Gender stuSex;

    @Parameter(description = "学生当前学校id")
    private Long stuCurSchoolId;

    @Parameter(description = "学生当前年级id")
    private Long stuCurGradeId;
}
