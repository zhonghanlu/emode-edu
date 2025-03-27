package com.mini.pojo.model.vo.business;

import com.mini.common.enums.str.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @Author : zhl
 * @Date: 2025/3/27 20:08
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatriarchStuProfileInfo {

    @Schema(title = "学生 id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "学生头像id")
    private String stuAvatarId;

    @Schema(title = "学生头像")
    private String stuAvatarUrl;

    @Schema(name = "学生性别")
    private Gender stuSex;

    @Schema(name = "学生生日（出生日期）")
    private LocalDateTime stuBirth;

    @Schema(title = "学生当前学校id")
    private Long stuCurSchoolId;

    @Schema(title = "学生当前学校")
    private String stuCurSchool;

    @Schema(title = "学生当前年级id")
    private Long stuCurGradeId;

    @Schema(title = "学生当前年级")
    private String stuCurGrade;

}
