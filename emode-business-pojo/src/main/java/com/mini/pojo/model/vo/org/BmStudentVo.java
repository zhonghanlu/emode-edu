package com.mini.pojo.model.vo.org;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mini.common.enums.str.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 学生表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "学生展示")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStudentVo {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "学生头像id")
    private Long stuAvatarId;

    @Schema(title = "学生头像id")
    private String stuAvatarUrl;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "学生性别")
    private Gender stuSex;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(title = "学生生日（出生日期）")
    private LocalDateTime stuBirth;

    @Schema(title = "学生当前学校id")
    private Long stuCurSchoolId;

    @Schema(title = "学生当前学校")
    private String stuCurSchool;

    @Schema(title = "学生当前年级id")
    private Long stuCurGradeId;

    @Schema(title = "学生当前年级")
    private String stuCurGrade;

    @Schema(title = "学生课时相关数据")
    private List<BmStuClassHourDataVo> bmStuClassHourDataVoList;

}
