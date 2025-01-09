package com.mini.pojo.model.vo.org;

import com.mini.common.enums.str.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * <p>
 * 老师表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "教师展示")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTeacherDetailVo {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "教师头像")
    private Long teaAvatarId;

    @Schema(title = "教师头像Url")
    private String teaAvatarUrl;

    @Schema(title = "教师名称")
    private String teaName;

    @Schema(title = "性别")
    private Gender sex;

    @Schema(title = "教师手机号")
    private String teaPhone;

    @Schema(title = "教师邮箱")
    private String teaEmail;

    @Schema(title = "归属机构id")
    private Long teaOrgId;

    @Schema(title = "归属机构名称")
    private String teaOrgName;

    @Schema(title = "意向时间列表")
    private List<BmTeacherIntentionVo> bmTeacherIntentionVoList;
}
