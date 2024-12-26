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

    public static final Map<String, Integer> weekOneMap = new HashMap<>();

    static {
        // 根据上下午找到课程时间
        courseTimeMap.put("up_one", Arrays.asList(LocalTime.of(10, 0, 0), LocalTime.of(12, 0, 0)));
        courseTimeMap.put("down_one", Arrays.asList(LocalTime.of(14, 0, 0), LocalTime.of(16, 0, 0)));
        courseTimeMap.put("down_two", Arrays.asList(LocalTime.of(16, 30, 0), LocalTime.of(18, 30, 0)));

        // 根据意向时间找到周几
        weekOneMap.put("monday", 1);
        weekOneMap.put("tuesday", 2);
        weekOneMap.put("wednesday", 3);
        weekOneMap.put("thursday", 4);
        weekOneMap.put("friday", 5);
        weekOneMap.put("saturday", 6);
        weekOneMap.put("sunday", 7);
    }

}
