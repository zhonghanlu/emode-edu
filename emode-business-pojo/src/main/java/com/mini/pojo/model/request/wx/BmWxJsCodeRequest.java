package com.mini.pojo.model.request.wx;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotEmpty;

/**
 * @author zhonghanlu
 * @date 2025年2月26日15:55:53
 * @desc 微信jsCode请求参数
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmWxJsCodeRequest {

    @NotEmpty(message = "code 码不可为空")
    @Schema(title = "前端生成的jsCode")
    private String jsCode;

}
