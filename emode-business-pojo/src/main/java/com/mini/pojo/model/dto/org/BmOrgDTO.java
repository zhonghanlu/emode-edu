package com.mini.pojo.model.dto.org;

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
     * 机构状态 是否地图注册
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
    /**
     * 机构营业执照Url
     */
    @Schema(title = "机构营业执照Url")
    private String orgBusinessLicenseUrl;
}
