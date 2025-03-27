package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;
import lombok.Getter;

import java.util.Arrays;

/**
 * @Author : zhl
 * @Date: 2025/3/27 20:50
 * @Description:
 */
@Getter
public enum CurTutorType implements StringEnum {
    // 网课
    PYTHON("online", 1.0),
    // 家教
    CPP("home", 2.0),
    // 到校
    SCRATCH("school", 1.5);

    private final String value;

    private final Double sort;

    CurTutorType(String value, Double sort) {
        this.value = value;
        this.sort = sort;
    }

    @JsonCreator
    public static CurTutorType get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }
}
