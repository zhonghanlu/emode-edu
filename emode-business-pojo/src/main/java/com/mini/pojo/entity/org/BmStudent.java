package com.mini.pojo.entity.org;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.Gender;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

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
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_student")
public class BmStudent extends CommonEntity {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键id")
    @TableId
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
