package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.Arrays;

/**
 * @author zhl
 * @create 2024/12/5 16:47
 */
public enum PosterType implements StringEnum {

//    （线下首页推荐海报）（线下运营宣传）（小程序首页）（小程序课程）（家校一体推广）

    // 线下首页推荐海报
    OFFLINE_RECOMMENDED("offline_recommended"),
    // 线下运营宣传
    OFFLINE_OPERATE("offline_operate"),
    // 小程序首页
    MINI_HOME_PAGE("mini_home_page"),
    // 小程序课程
    MINI_COURSE_PAGE("mini_course_page"),
    // 家校一体推广
    MINI_EDU_PAGE("mini_edu_page"),
    // other
    OTHER("other");

    private final String value;

    PosterType(String value) {
        this.value = value;
    }

    @JsonCreator
    public static PosterType get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonValue
    @Override
    public String getStringValue() {
        return value;
    }

}
