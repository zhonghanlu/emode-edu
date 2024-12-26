package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @author zhl
 * @create 2024/12/26 15:26
 */
public enum ClassGradeStatus implements StringEnum {
    // 正常
    NORMAL("normal"),
    // 结束
    END("end");

    private final String value;

    ClassGradeStatus(String value) {
        this.value = value;
    }

    @JsonCreator
    public static ClassGradeStatus get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }
}
