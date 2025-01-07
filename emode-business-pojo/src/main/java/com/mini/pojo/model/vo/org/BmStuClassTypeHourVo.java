package com.mini.pojo.model.vo.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * <p>
 * 学生表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "学生所有课程类型对应课时展示")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStuClassTypeHourVo {

    @Schema(title = "学生主键id")
    private Long id;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "学生对应课时信息")
    private List<BmStuClassHourVo> bmStuClassHourVoList;
}
