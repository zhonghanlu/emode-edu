package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @Author : zhl
 * @Date: 2024/12/17 20:53
 * @Description:
 */
public enum HandlerClassStatus implements StringEnum {
    // 待分班
    TO_HANDLER_CLASS("to_handler_class"),
    // 待确认
    TO_CONFIRMED("to_confirmed"),
    // 已分班
    HANDLER_CLASS_ED("handler_class_ed");

    private final String value;

    HandlerClassStatus(String value) {
        this.value = value;
    }

    @JsonCreator
    public static HandlerClassStatus get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }
}
