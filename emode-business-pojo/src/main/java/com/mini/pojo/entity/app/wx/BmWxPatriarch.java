package com.mini.pojo.entity.app.wx;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 微信用户与家长信息绑定
 * </p>
 *
 * @author zhl
 * @since 2025-02-26
 */
@Schema(description = "微信用户与家长信息绑定")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("bm_wx_patriarch")
public class BmWxPatriarch implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "微信用户数据主键id")
    private Long wxId;

    @Schema(title = "家长数据id")
    private Long patriarchId;


}
