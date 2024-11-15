package com.mini.pojo.entity.manager;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 老师表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "老师表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_teacher")
public class BmTeacher extends CommonEntity {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键id")
    @TableId
    private Long id;

    @Schema(name = "教师头像")
    private Long teaAvatarId;

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
