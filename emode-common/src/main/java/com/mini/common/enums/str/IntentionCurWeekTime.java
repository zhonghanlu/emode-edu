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
public enum IntentionCurWeekTime implements StringEnum {
    /**
     * 周六
     */
    SATURDAY("saturday"),
    /**
     * 周日
     */
    SUNDAY("sunday");

    private final String value;

    IntentionCurWeekTime(String value) {
        this.value = value;
    }

    @JsonCreator
    public static IntentionCurWeekTime get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    public String getStringValue() {
        return value;
    }
}
