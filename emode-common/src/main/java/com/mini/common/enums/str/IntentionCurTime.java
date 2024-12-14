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
public enum IntentionCurTime implements StringEnum {
    /**
     * 周六_上午_第一次课
     */
    SATURDAY_UP_ONE("saturday_up_one"),
    /**
     * 周六_下午_第一次课
     */
    SATURDAY_DOWN_ONE("saturday_down_one"),
    /**
     * 周六_下午_第二次课
     */
    SATURDAY_DOWN_TWO("saturday_down_two"),

    /**
     * 周日_上午_第一次课
     */
    SUNDAY_UP_ONE("sunday_up_one"),
    /**
     * 周日_下午_第一次课
     */
    SUNDAY_DOWN_ONE("sunday_down_one"),
    /**
     * 周日_下午_第二次课
     */
    SUNDAY_DOWN_TWO("sunday_down_two");

    private final String value;

    IntentionCurTime(String value) {
        this.value = value;
    }

    @JsonCreator
    public static IntentionCurTime get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    public String getStringValue() {
        return value;
    }
}
