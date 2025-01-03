package com.mini.pojo.model.dto.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author zhl
 * @create 2025/1/3 10:45
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPatStuRelationDTO {

    @Schema(name = "学生id")
    private Long stuId;

    @Schema(name = "家长主键id")
    private Long patId;

    @Schema(name = "家长头像")
    private Long patAvatarId;

    @Schema(name = "家长姓名")
    private String patName;

    @Schema(name = "家长手机号")
    private String patPhone;

    @Schema(name = "家长微信")
    private String patWx;

    @Schema(name = "家长地址")
    private String patAddress;

}
