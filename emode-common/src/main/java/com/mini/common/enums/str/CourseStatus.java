package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @author zhl
 * @create 2024/12/30 16:51
 */
public enum CourseStatus implements StringEnum {
    // 待上课
    WAIT_FOR_CLASS("wait_for_class"),
    // 已上课
    CLASS_HAS_STARTED("class_has_started"),
    // 已结束
    CLASS_HAS_END("class_has_end"),
    // 已过期
    CLASS_HAS_EXPIRE("class_has_expire");

    private final String value;

    CourseStatus(String value) {
        this.value = value;
    }

    @JsonCreator
    public static CourseStatus get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }
}
