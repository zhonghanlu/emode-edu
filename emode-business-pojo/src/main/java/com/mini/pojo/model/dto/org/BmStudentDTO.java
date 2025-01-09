package com.mini.pojo.model.dto.org;

import com.baomidou.mybatisplus.annotation.TableId;
import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
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

    @Schema(title = "学生当前学校id")
    private Long stuCurSchoolId;

    @Schema(title = "学生当前学校")
    private String stuCurSchool;

    @Schema(title = "学生当前年级id")
    private Long stuCurGradeId;

    @Schema(title = "学生当前年级")
    private String stuCurGrade;

    @Schema(title = "学生课时相关数据")
    private List<BmStuClassHourDataDTO> bmStuClassHourDataDTOList;


}
