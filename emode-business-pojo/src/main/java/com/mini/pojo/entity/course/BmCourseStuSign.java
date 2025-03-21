package com.mini.pojo.entity.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.SignStatus;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 学生上课签到表
 * </p>
 *
 * @author zhl
 * @since 2024-12-31
 */
@Schema(description = "学生上课签到表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_course_stu_sign")
public class BmCourseStuSign extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键id")
    @TableId
    private Long id;

    @Schema(title = "课程id")
    private Long courseId;

    @Schema(title = "学生id")
    private Long stuId;

    @Schema(title = "签到状态")
    private SignStatus signStatus;

}
