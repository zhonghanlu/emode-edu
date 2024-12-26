package com.mini.common.enums.str;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import com.mini.common.enums.converter.StringEnum;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author : zhl
 * @Date: 2024/12/14 13:42
 * @Description: 意向上课时间枚举
 */
public enum IntentionCurTime implements StringEnum {

    //////////////////////////////短期///////////////////////////////

    /**
     * 周一_上午_第一次课
     */
    SHORT_MONDAY_UP_ONE("short_monday_up_one"),
    /**
     * 周一_下午_第一次课
     */
    SHORT_MONDAY_DOWN_ONE("short_monday_down_one"),
    /**
     * 周一_下午_第二次课
     */
    SHORT_MONDAY_DOWN_TWO("short_monday_down_two"),

    /**
     * 周二_上午_第一次课
     */
    SHORT_TUESDAY_UP_ONE("short_tuesday_up_one"),
    /**
     * 周二_下午_第一次课
     */
    SHORT_TUESDAY_DOWN_ONE("short_tuesday_down_one"),
    /**
     * 周二_下午_第二次课
     */
    SHORT_TUESDAY_DOWN_TWO("short_tuesday_down_two"),

    /**
     * 周三_上午_第一次课
     */
    SHORT_WEDNESDAY_UP_ONE("short_wednesday_up_one"),

    /**
     * 周三_下午_第一次课
     */
    SHORT_WEDNESDAY_DOWN_ONE("short_wednesday_down_one"),

    /**
     * 周三_下午_第二次课
     */
    SHORT_WEDNESDAY_DOWN_TWO("short_wednesday_down_two"),

    /**
     * 周四_上午_第一次课
     */
    SHORT_THURSDAY_UP_ONE("short_thursday_up_one"),

    /**
     * 周四_下午_第一次课
     */
    SHORT_THURSDAY_DOWN_ONE("short_thursday_down_one"),

    /**
     * 周四_下午_第二次课
     */
    SHORT_THURSDAY_DOWN_TWO("short_thursday_down_two"),

    /**
     * 周五_上午_第一次课
     */
    SHORT_FRIDAY_UP_ONE("short_friday_up_one"),

    /**
     * 周五_下午_第一次课
     */
    SHORT_FRIDAY_DOWN_ONE("short_friday_down_one"),

    /**
     * 周五_下午_第二次课
     */
    SHORT_FRIDAY_DOWN_TWO("short_friday_down_two"),


    //////////////////////////////长期///////////////////////////////

    /**
     * 周六_上午_第一次课
     */
    LONG_SATURDAY_UP_ONE("long_saturday_up_one"),

    /**
     * 周六_下午_第一次课
     */
    LONG_SATURDAY_DOWN_ONE("long_saturday_down_one"),

    /**
     * 周六_下午_第二次课
     */
    LONG_SATURDAY_DOWN_TWO("long_saturday_down_two"),

    /**
     * 周日_上午_第一次课
     */
    LONG_SUNDAY_UP_ONE("long_sunday_up_one"),

    /**
     * 周日_下午_第一次课
     */
    LONG_SUNDAY_DOWN_ONE("long_sunday_down_one"),

    /**
     * 周日_下午_第二次课
     */
    LONG_SUNDAY_DOWN_TWO("long_sunday_down_two");

    private final String value;

    IntentionCurTime(String value) {
        this.value = value;
    }

    @JsonCreator
    public static IntentionCurTime get(String val) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().equalsIgnoreCase(val)).findFirst().orElse(null);
    }

    @JsonCreator
    public static List<IntentionCurTime> getListValByType(String type) {
        return Arrays.stream(values()).filter(e -> e.getStringValue().startsWith(type)).collect(Collectors.toList());
    }

    @JsonCreator
    public static List<IntentionCurTime> getListValByWeek(List<String> weekOneList) {
        List<IntentionCurTime> intentionCurTimeList = new ArrayList<>();
        weekOneList.forEach(w -> intentionCurTimeList.addAll(Arrays.stream(values())
                .filter(e -> e.getStringValue().contains(w)).collect(Collectors.toList())));
        return intentionCurTimeList;
    }

    @JsonValue
    public String getStringValue() {
        return value;
    }
}
