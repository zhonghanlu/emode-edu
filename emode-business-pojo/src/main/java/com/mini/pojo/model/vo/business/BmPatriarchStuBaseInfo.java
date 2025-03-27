package com.mini.pojo.model.vo.business;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author : zhl
 * @Date: 2025/3/27 20:08
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatriarchStuBaseInfo {

    @Schema(title = "学生 id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "学生头像")
    private String stuAvatarUrl;

}
