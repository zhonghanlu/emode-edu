package com.mini.pojo.entity.operate;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.PosterType;
import com.mini.common.enums.str.YesOrNo;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 海报统一管理表
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Schema(description = "海报统一管理表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_poster")
public class BmPoster extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键id")
    @TableId
    private Long id;

    @Schema(title = "图片id")
    private Long posterFileId;

    @Schema(title = "图片地址")
    private String posterUrl;

    @Schema(title = "（线下首页推荐海报）（线下运营宣传）（小程序首页）（小程序课程）（家校一体推广）")
    private PosterType posterType;

    @Schema(title = "海报状态、使用、未使用")
    private YesOrNo posterStatus;

    @Schema(title = "绘画人")
    private String posterOptName;

}
