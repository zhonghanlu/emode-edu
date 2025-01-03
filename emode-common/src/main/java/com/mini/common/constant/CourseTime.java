package com.mini.common.constant;

import java.time.LocalTime;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zhl
 * @create 2024/12/26 17:00
 */
public final class CourseTime {

    private CourseTime() {
    }

    public static final Map<String, List<LocalTime>> COURSE_TIME_MAP = new HashMap<>();

    public static final Map<String, Integer> WEEK_ONE_MAP = new HashMap<>();

    static {
        // 根据上下午找到课程时间
        COURSE_TIME_MAP.put("up_one", Arrays.asList(LocalTime.of(10, 0, 0), LocalTime.of(12, 0, 0)));
        COURSE_TIME_MAP.put("down_one", Arrays.asList(LocalTime.of(14, 0, 0), LocalTime.of(16, 0, 0)));
        COURSE_TIME_MAP.put("down_two", Arrays.asList(LocalTime.of(16, 30, 0), LocalTime.of(18, 30, 0)));

        // 根据意向时间找到周几
        WEEK_ONE_MAP.put("monday", 1);
        WEEK_ONE_MAP.put("tuesday", 2);
        WEEK_ONE_MAP.put("wednesday", 3);
        WEEK_ONE_MAP.put("thursday", 4);
        WEEK_ONE_MAP.put("friday", 5);
        WEEK_ONE_MAP.put("saturday", 6);
        WEEK_ONE_MAP.put("sunday", 7);
    }

}
