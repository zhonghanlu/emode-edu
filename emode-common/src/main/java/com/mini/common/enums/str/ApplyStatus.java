package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @Author : zhl
 * @Date: 2024/12/3 21:43
 * @Description:
 */
public enum ApplyStatus implements StringEnum {

    // 已申请
    APPLY_ING("apply_ing"),
    // 已接受
    ACCEPT("accept"),
    // 正在前往
    TO_ING("to_ing"),
    // 在授课
    GIVE_CLASS_ING("give_class_ing"),
    // 已结束
    APPLY_END("apply_end");

    private final String value;

    ApplyStatus(String value) {
        this.value = value;
    }

    @JsonCreator
    public static ApplyStatus get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }
}
