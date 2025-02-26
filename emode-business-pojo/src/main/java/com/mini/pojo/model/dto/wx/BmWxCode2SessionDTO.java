package com.mini.pojo.model.dto.wx;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author zhonghanlu
 * @date 2025年2月26日15:57:43
 * code2Session 结果返回集
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmWxCode2SessionDTO {

    @Schema(title = "session_key")
    private String session_key;

    @Schema(title = "unionid")
    private String unionid;

    @Schema(title = "errmsg")
    private String errmsg;

    @Schema(title = "openid")
    private String openid;

    @Schema(title = "errcode")
    private String errcode;

}
