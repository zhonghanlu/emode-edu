package com.mini.oj.ai;

import cn.hutool.json.JSONUtil;
import com.mini.common.utils.JsonUtils;
import com.mini.oj.ai.model.ChatRequest;
import com.mini.oj.ai.model.ChatRequest.Response_format;
import com.mini.oj.ai.model.ChatResponse;
import lombok.Data;
import okhttp3.*;
import okio.BufferedSource;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import java.io.IOException;
import java.util.Collections;
import java.util.concurrent.TimeUnit;

/**
 * @author zhl
 * @create 2025/1/8 13:52
 * @description deepseek 工具类
 * 单论对话，多轮对话
 */
@Data
public class DeepseekUtil {

    // client连接池
    private static final OkHttpClient client = new OkHttpClient().newBuilder()
            .connectTimeout(60, TimeUnit.SECONDS)
            .readTimeout(60, TimeUnit.SECONDS)
            .connectionPool(new ConnectionPool(20, 5, TimeUnit.MINUTES))
            .build();

    // deepseek配置
    private final DeepseekProperties deepseekProperties;

    /**
     * 流式对话，通过flag控制是否多轮
     */
    public StreamingResponseBody streamChat(String question, boolean multiwheel) {
        MediaType mediaType = MediaType.parse("application/json; charset=utf-8");
        String requestContent = initRequest(question);

        RequestBody body = RequestBody.create(requestContent, mediaType);

        Request request = new Request.Builder()
                .url(deepseekProperties.getUrl())
                .post(body)
                .addHeader("Content-Type", "application/json; charset=utf-8")
                .addHeader("Authorization", "Bearer " + deepseekProperties.getApiKey())
                .build();
        return getStreamResponseBody(request, multiwheel);
    }

    /**
     * 返回流式响应
     */
    private StreamingResponseBody getStreamResponseBody(Request request, boolean multiwheel) {
        return outputStream -> {
            try (Response response = client.newCall(request).execute()) {
                if (response.isSuccessful() && response.body() != null) {
                    BufferedSource source = response.body().source();
                    StringBuilder assistantReply = new StringBuilder();

                    while (!source.exhausted()) {
                        String line = source.readUtf8Line();
                        if (line != null && !line.isEmpty()) {
                            ChatResponse chatResponse = JSONUtil.toBean(line, ChatResponse.class);
                            String content = chatResponse.getChoices().get(0).getMessage().getContent();

                            if (content != null) {
                                outputStream.write(content.getBytes()); // 将内容写入输出流
                                outputStream.flush();
                                assistantReply.append(content); // 将回复内容拼接到完整回复中
                            }
                        }
                    }

                    // 添加模型回复到对话历史 TODO 多轮会话
//                    ChatRequest.Messages assistantMsg = new ChatRequest.Messages();
//                    assistantMsg.setRole("assistant");
//                    assistantMsg.setContent(assistantReply.toString());
//                    userChatHistory.get(userId).add(assistantMsg);
                } else {
                    outputStream.write(("请求失败，状态码: " + response.code()).getBytes());
                }
            } catch (IOException e) {
                outputStream.write(("请求发送失败: " + e.getMessage()).getBytes());
            }
        };
    }

    /**
     * 初始化请求参数
     */
    private String initRequest(String question) {
        ChatRequest chatRequest = new ChatRequest();
        ChatRequest.Messages messages = new ChatRequest.Messages();
        messages.setContent(question);
        messages.setRole("user");
        messages.setName("启智编梦");

        chatRequest.setMessages(Collections.singletonList(messages));
        chatRequest.setModel("deepseek-chat");
        chatRequest.setFrequency_penalty(0);
        chatRequest.setMax_tokens(4096);
        chatRequest.setPresence_penalty(0);

        Response_format responseFormat = new Response_format();
        responseFormat.setType("text");
        chatRequest.setResponse_format(responseFormat);

        chatRequest.setStream(true); // 设置为流式响应
        chatRequest.setTemperature(1);
        chatRequest.setTop_p(1);
        return JsonUtils.toJsonString(chatRequest);
    }
}
