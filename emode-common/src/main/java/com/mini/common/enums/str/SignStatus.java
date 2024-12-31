package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @author zhl
 * @create 2024/12/31 16:17
 */
public enum SignStatus implements StringEnum {

    // 已到
    ARRIVED("arrived"),
    // 未到
    NON_ARRIVED("non_arrived");

    private final String value;

    SignStatus(String value) {
        this.value = value;
    }

    @JsonCreator
    public static SignStatus get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }

}
