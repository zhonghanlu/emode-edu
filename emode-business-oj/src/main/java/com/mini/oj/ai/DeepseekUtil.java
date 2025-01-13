package com.mini.oj.ai;

import cn.hutool.json.JSONUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mini.common.utils.JsonUtils;
import com.mini.common.utils.http.IPUtils;
import com.mini.oj.ai.model.ChatRequest;
import com.mini.oj.ai.model.ChatRequest.Response_format;
import com.mini.oj.ai.model.ChatResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import okio.BufferedSource;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

/**
 * @author zhl
 * @create 2025/1/8 13:52
 * @description deepseek 工具类
 * 单论对话，多轮对话
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class DeepseekUtil {

    // client连接池
    private static final OkHttpClient client = new OkHttpClient().newBuilder()
            .connectTimeout(60, TimeUnit.SECONDS)
            .readTimeout(60, TimeUnit.SECONDS)
            .connectionPool(new ConnectionPool(20, 5, TimeUnit.MINUTES))
            .build();

    // deepseek配置
    private final DeepseekProperties deepseekProperties;

    private Map<String, List<ChatRequest.Messages>> userChatHistory = new ConcurrentHashMap<>();

    /**
     * 流式对话，通过flag控制是否多轮
     */
    public StreamingResponseBody streamChat(String question, boolean multiwheel) {
        MediaType mediaType = MediaType.parse("application/json; charset=utf-8");
        ChatRequest chatRequest = initRequest(question);

        // 处理多轮会话
//        if (multiwheel) {
        List<ChatRequest.Messages> messagesList = userChatHistory.get(IPUtils.getIp());
        if (CollectionUtils.isEmpty(messagesList)) {
            messagesList = new ArrayList<>();
        }

        int size = messagesList.size();

        if (size >= 10) {
            messagesList.remove(0);
        }

        ChatRequest.Messages assistantMsg = new ChatRequest.Messages();
        assistantMsg.setRole("user");
        assistantMsg.setContent(question);
        messagesList.add(assistantMsg);
        userChatHistory.put(IPUtils.getIp(), messagesList);

        // 塞入请求内容中
        chatRequest.setMessages(messagesList);
//        }
        RequestBody body = RequestBody.create(Objects.requireNonNull(JsonUtils.toJsonString(chatRequest)), mediaType);

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
                            if (line.startsWith("data: ")) {
                                line = line.substring(6);
                            }
                            if (isJson(line)) {
                                ChatResponse chatResponse = JSONUtil.toBean(line, ChatResponse.class);

                                List<ChatResponse.Choices> choicesList = chatResponse.getChoices();

                                String content = null;
                                if (CollectionUtils.isNotEmpty(choicesList)) {
                                    ChatResponse.Choices message = choicesList.get(0);
                                    if (Objects.nonNull(message) && Objects.nonNull(message.getDelta())) {
                                        content = message.getDelta().getContent();
                                    }
                                }


                                // 非流式返回
//                                if (CollectionUtils.isNotEmpty(choicesList)) {
//                                    ChatResponse.Choices message = choicesList.get(0);
//                                    if (Objects.nonNull(message) && Objects.nonNull(message.getMessage())) {
//                                        content = message.getMessage().getContent();
//                                    }
//                                }

                                if (content != null) {
                                    outputStream.write(content.getBytes()); // 将内容写入输出流
                                    outputStream.flush();
                                    assistantReply.append(content); // 将回复内容拼接到完整回复中
                                }
                            }
                        }
                    }

                    // 添加模型回复到对话历史 TODO 多轮会话
                    ChatRequest.Messages assistantMsg = new ChatRequest.Messages();
                    assistantMsg.setRole("assistant");
                    assistantMsg.setContent(assistantReply.toString());
                    userChatHistory.get(IPUtils.getIp()).add(assistantMsg);
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
    private ChatRequest initRequest(String question) {
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
        return chatRequest;
    }

    /**
     * 判断文件是否为json
     */
    public boolean isJson(String input) {
        try {
            // 使用ObjectMapper的readValue方法尝试解析字符串，若成功则为合法的json
            new ObjectMapper().readValue(input, Object.class);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
