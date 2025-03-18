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
 * 家长与系统用关联
 * </p>
 *
 * @author zhl
 * @since 2025-02-26
 */
@Schema(description = "家长与系统用关联")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("bm_user_patriarch")
public class BmUserPatriarch implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "家长主键id")
    private Long patriarchId;

    @Schema(title = "系统用户id")
    private Long userId;


}
