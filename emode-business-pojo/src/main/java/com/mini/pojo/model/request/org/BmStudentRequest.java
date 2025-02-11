package com.mini.pojo.model.request.org;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mini.common.enums.str.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * <p>
 * 学生表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "学生请求")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStudentRequest {

    @Schema(title = "学生头像id")
    private Long stuAvatarId;

    @NotBlank(message = "姓名不可为空")
    @Schema(title = "学生姓名")
    private String stuName;

    @NotNull(message = "性别不可为空")
    @Schema(title = "学生性别")
    private Gender stuSex;

    @NotNull(message = "出生日期不可为空")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(title = "学生生日（出生日期）")
    private LocalDateTime stuBirth;

    @NotNull(message = "学校id不可为空")
    @Schema(title = "学生当前学校id")
    private Long stuCurSchoolId;

    @NotBlank(message = "学校不可为空")
    @Schema(title = "学生当前学校")
    private String stuCurSchool;

    @NotNull(message = "年级id不可为空")
    @Schema(title = "学生当前年级id")
    private Long stuCurGradeId;

    @NotBlank(message = "年级不可为空")
    @Schema(title = "学生当前年级")
    private String stuCurGrade;

    @NotNull(message = "家长id 不可为空")
    @Schema(title = "家长id")
    private Long patriarchId;

    @NotNull(message = "是否开通 oj  默认为 false")
    @Schema(title = "是否开通oj账户")
    private Boolean ojFlag;
}
