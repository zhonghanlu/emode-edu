package com.mini.pojo.model.vo.course;

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
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseStuSignVo {

    @Schema(title = "签到主键id")
    private Long signId;

    @Schema(title = "学生id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "签到状态")
    private SignStatus signStatus;

}
