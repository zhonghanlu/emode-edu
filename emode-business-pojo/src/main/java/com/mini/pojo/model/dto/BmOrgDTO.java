package com.mini.pojo.model.dto;

import com.baomidou.mybatisplus.annotation.TableId;
import com.mini.common.enums.str.YesOrNo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author zhl
 * @create 2024/8/30 16:01
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmOrgDTO {

    /**
     * 机构id
     */
    @TableId
    @Schema(name = "机构id")
    private Long id;
    /**
     * 机构名称
     */
    @Schema(name = "机构名称")
    private String orgName;
    /**
     * 机构地址
     */
    @Schema(name = "机构地址")
    private String orgAddress;
    /**
     * 机构经度
     */
    @Schema(name = "机构经度")
    private String orgLongitude;
    /**
     * 机构纬度
     */
    @Schema(name = "机构纬度")
    private String orgLatitude;
    /**
     * 机构描述
     */
    @Schema(name = "机构描述")
    private String orgDescribed;
    /**
     * 机构状态
     */
    @Schema(name = "机构状态")
    private YesOrNo orgStatus;


}
