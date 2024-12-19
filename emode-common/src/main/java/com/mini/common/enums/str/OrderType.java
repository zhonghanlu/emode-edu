package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @author zhl
 * @create 2024/12/19 10:16
 */
public enum OrderType implements StringEnum {

    // 补单
    PATCH("patch"),
    // 普通订单
    SIMPLE("simple");

    private String value;

    OrderType(String value) {
        this.value = value;
    }

    @JsonCreator
    public static OrderType get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }


}
