package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;
import lombok.Getter;

import java.util.Arrays;

/**
 * 课程类型
 *
 * @author zhl
 * @create 2024-11-19 22:38
 */
@Getter
public enum CourseType implements StringEnum {
    // python
    PYTHON("python", 1),
    // c++
    CPP("cpp", 2),
    // scratch
    SCRATCH("scratch", 3);

    private final String value;

    private final Integer sort;

    CourseType(String value, Integer sort) {
        this.value = value;
        this.sort = sort;
    }

    @JsonCreator
    public static CourseType get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }

}
