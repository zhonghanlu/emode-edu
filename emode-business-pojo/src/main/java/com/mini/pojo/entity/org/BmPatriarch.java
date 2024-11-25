package com.mini.pojo.entity.org;

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
 * 家长表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "家长表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_patriarch")
public class BmPatriarch extends CommonEntity {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键id")
    @TableId
    private Long id;

    @Schema(name = "家长头像")
    private Long patAvatarId;

    @Schema(name = "家长姓名")
    private String patName;

    @Schema(name = "家长手机号")
    private String patIphone;

    @Schema(name = "家长微信")
    private String patWx;

    @Schema(name = "家长地址")
    private String patAddress;

}
