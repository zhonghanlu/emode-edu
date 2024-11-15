package com.mini.pojo.model.edit;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 老师表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "教师修改")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTeacherEdit {

    @NotNull(message = "主键id不可为空")
    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "教师头像")
    private Long teaAvatarId;

    @Schema(title = "教师名称")
    private String teaName;

    @Schema(title = "教师手机号")
    private String teaIphone;

    @Schema(title = "教师邮箱")
    private String teaEmail;

    @Schema(title = "归属机构id")
    private Long teaOrgId;

    @Schema(title = "归属机构名称")
    private String teaOrgName;

}
