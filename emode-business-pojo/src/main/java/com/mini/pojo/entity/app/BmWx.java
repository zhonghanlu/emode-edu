package com.mini.pojo.entity.app;

import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.number.Delete;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 微信用户数据
 * </p>
 *
 * @author zhl
 * @since 2025-02-26
 */
@Schema(description = "微信用户数据")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("bm_wx")
public class BmWx implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "微信unionId")
    private String unionId;

    @Schema(title = "微信openId")
    private String openId;

    @Schema(title = "微信名称")
    private String wxName;

    @Schema(title = "头像id")
    private Long avatarId;

    @Schema(title = "头像本地地址")
    private String avatarUrl;

    @Schema(title = "手机号")
    private Long phoneNumber;

    @Schema(title = "地址，国家省市区用‘，’隔开")
    private String address;

    @Schema(title = "创建时间")
    private LocalDateTime createTime;

    @Schema(title = "删除标识1未删除 -1已删除")
    private Delete delFlag;


}
