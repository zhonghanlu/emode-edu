package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @author zhl
 * @create 2024/12/31 16:15
 */
public enum CourseFileType implements StringEnum {

    // 讲义
    HANDOUTS("handouts"),
    // 作业
    TASK("task");

    private final String value;

    CourseFileType(String value) {
        this.value = value;
    }

    @JsonCreator
    public static CourseFileType get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }

}
