package com.mini.pojo.model.vo.business;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @Author : zhl
 * @Date: 2025/3/19 20:32
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatriarchStuInfoVo {

    @Schema(title = "学生 id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "学生头像id")
    private Long stuAvatarId;

    @Schema(title = "学生头像id")
    private String stuAvatarUrl;

    @Schema(title = "班级名称")
    private String classGradeName;

    @Schema(title = "课中状态信息")
    private List<ClassIngInfoVo> classIngInfoList;
}
