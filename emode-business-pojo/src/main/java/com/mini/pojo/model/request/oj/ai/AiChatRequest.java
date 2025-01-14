package com.mini.pojo.model.request.oj.ai;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author zhl
 * @create 2025/1/13 14:41
 */
@Data
public class AiChatRequest {

    @Schema(title = "消息体")
    private String message;
}
