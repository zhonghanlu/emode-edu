package com.mini.pojo.model.vo.org;

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
@Schema(description = "学生家长信息展示")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStudentPatInfoVo {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "学生家长信息")
    private BmPatriarchVo bmPatriarchVo;
}
