package com.mini.pojo.model.query.org;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mini.common.enums.str.Gender;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

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

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Parameter(description = "学生生日（出生日期）")
    private LocalDateTime stuBirth;

    @Parameter(description = "学生当前学校")
    private String stuCurSchool;

    @Parameter(description = "学生当前年级")
    private String stuCurGrade;

}
