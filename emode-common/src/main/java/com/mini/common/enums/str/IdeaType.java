package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @author zhl
 * @create 2024/12/5 16:42
 */
public enum IdeaType implements StringEnum {
    // 系统问题
    SYSTEM("system"),
    // 课程问题
    COURSE("course"),
    // 教师问题
    TEACHER("teacher"),
    // other
    OTHER("other");

    private final String value;

    IdeaType(String value) {
        this.value = value;
    }

    @JsonCreator
    public static IdeaType get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }
}
