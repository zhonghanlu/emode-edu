package com.mini.pojo.entity.org;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.YesOrNo;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 机构表;
 *
 * @author : zhl
 * @date : 2024-8-30
 */
@Schema(description = "机构表")
@TableName("bm_org")
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class BmOrg extends CommonEntity {
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
     * 机构状态是否地图注册
     */
    @Schema(name = "机构状态,是否地图注册")
    private YesOrNo orgStatus;
    /**
     * 机构负责人A
     */
    @Schema(name = "机构负责人A")
    private String orgHeadA;
    /**
     * 机构负责人B
     */
    @Schema(name = "机构负责人B")
    private String orgHeadB;
    /**
     * 机构营业执照
     */
    @Schema(name = "机构营业执照")
    private Long orgBusinessLicense;
}
