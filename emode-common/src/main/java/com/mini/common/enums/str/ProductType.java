package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @Author : zhl
 * @Date: 2024/12/14 15:16
 * @Description:
 */
public enum ProductType implements StringEnum {

    // 体验
    TRY("try"),
    // 长期
    LONG("long");

    private final String value;

    ProductType(String value) {
        this.value = value;
    }

    @JsonCreator
    public static ProductType get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }

}
