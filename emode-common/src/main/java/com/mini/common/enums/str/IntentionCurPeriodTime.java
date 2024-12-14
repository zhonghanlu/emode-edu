package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @Author : zhl
 * @Date: 2024/12/14 13:42
 * @Description:
 */
public enum IntentionCurPeriodTime implements StringEnum {
    /**
     * 上午
     */
    UP("up"),
    /**
     * 下午
     */
    DOWN("down");

    private final String value;

    IntentionCurPeriodTime(String value) {
        this.value = value;
    }

    @JsonCreator
    public static IntentionCurPeriodTime get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    public String getStringValue() {
        return value;
    }
}
