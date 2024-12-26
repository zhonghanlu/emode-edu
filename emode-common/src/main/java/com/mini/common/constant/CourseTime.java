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

    public static final Map<String, List<LocalTime>> courseTimeMap = new HashMap<>();

    static {
        courseTimeMap.put("up_one", Arrays.asList(LocalTime.of(10, 0, 0), LocalTime.of(12, 0, 0)));
        courseTimeMap.put("down_one", Arrays.asList(LocalTime.of(14, 0, 0), LocalTime.of(16, 0, 0)));
        courseTimeMap.put("down_two", Arrays.asList(LocalTime.of(16, 30, 0), LocalTime.of(18, 30, 0)));
    }

}
