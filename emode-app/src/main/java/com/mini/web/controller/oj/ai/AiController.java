package com.mini.web.controller.oj.ai;

import com.mini.oj.ai.DeepseekUtil;
import com.mini.pojo.model.request.oj.ai.AiChatRequest;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

/**
 * @author zhl
 * @create 2025/1/13 14:21
 */
@Tag(name = "ai对话", description = "ai对话")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-ai")
@RequiredArgsConstructor
public class AiController {

    private final DeepseekUtil deepseekUtil;

    @Operation(summary = "聊天")
    @PostMapping("/chat")
    public StreamingResponseBody chat(@RequestBody() AiChatRequest request) {
        return deepseekUtil.streamChat(request.getMessage());
    }

}
