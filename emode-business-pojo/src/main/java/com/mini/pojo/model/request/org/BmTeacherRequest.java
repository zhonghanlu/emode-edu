package com.mini.pojo.model.request.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 老师表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "教师请求")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTeacherRequest {

    @Schema(title = "教师头像")
    private Long teaAvatarId;

    @NotBlank(message = "教师名称")
    @Schema(title = "教师名称")
    private String teaName;

    @NotBlank(message = "教师手机号")
    @Schema(title = "教师手机号")
    private String teaIphone;

    @Schema(title = "教师邮箱")
    private String teaEmail;

    @Schema(title = "归属机构id")
    private Long teaOrgId;

    @Schema(title = "归属机构名称")
    private String teaOrgName;

}
