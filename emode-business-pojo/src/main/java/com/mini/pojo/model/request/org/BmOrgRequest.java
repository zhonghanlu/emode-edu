package com.mini.pojo.model.request.org;

import com.mini.common.enums.str.YesOrNo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * @author zhl
 * @create 2024/11/12 17:24
 */
@Schema(description = "机构请求")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmOrgRequest {

    /**
     * 机构名称
     */
    @NotBlank(message = "机构名称不可为空")
    @Schema(title = "机构名称")
    private String orgName;
    /**
     * 机构地址
     */
    @NotBlank(message = "机构地址不可为空")
    @Schema(title = "机构地址")
    private String orgAddress;
    /**
     * 机构经度
     */
    @Schema(title = "机构经度")
    private String orgLongitude;
    /**
     * 机构纬度
     */
    @Schema(title = "机构纬度")
    private String orgLatitude;
    /**
     * 机构描述
     */
    @Schema(title = "机构描述")
    private String orgDescribed;
    /**
     * 机构状态 是否地图注册
     */
    @Schema(title = "机构状态,是否地图注册")
    private YesOrNo orgStatus;
    /**
     * 机构负责人A
     */
    @Schema(title = "机构负责人A")
    private String orgHeadA;
    /**
     * 机构负责人B
     */
    @Schema(title = "机构负责人B")
    private String orgHeadB;
    /**
     * 机构营业执照
     */
    @Schema(title = "机构营业执照")
    private Long orgBusinessLicenseId;

}
