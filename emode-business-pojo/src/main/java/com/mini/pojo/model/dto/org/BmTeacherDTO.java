package com.mini.pojo.model.dto.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 老师表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTeacherDTO {

    @Schema(name = "主键id")
    private Long id;

    @Schema(name = "教师头像")
    private Long teaAvatarId;

    @Schema(name = "教师头像Url")
    private String teaAvatarUrl;

    @Schema(name = "教师名称")
    private String teaName;

    @Schema(name = "教师手机号")
    private String teaIphone;

    @Schema(name = "教师邮箱")
    private String teaEmail;

    @Schema(name = "归属机构id")
    private Long teaOrgId;

    @Schema(name = "归属机构名称")
    private String teaOrgName;

}
