package com.mini.pojo.model.dto.org;

import com.mini.common.enums.str.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * 学生表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "学生表")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStudentDTO {

    @Schema(name = "主键id")
    private Long id;

    @Schema(name = "学生姓名")
    private String stuName;

    @Schema(name = "学生性别")
    private Gender stuSex;

    @Schema(name = "学生生日（出生日期）")
    private LocalDateTime stuBirth;

    @Schema(name = "学生当前学校")
    private String stuCurSchool;

    @Schema(name = "学生当前年级")
    private String stuCurGrade;

}
