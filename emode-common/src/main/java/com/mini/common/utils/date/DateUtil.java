package com.mini.common.utils.date;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.chrono.ChronoLocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zhl
 * @create 2024/12/26 15:46
 * @desc 时间工具类
 */
public class DateUtil {

    private DateUtil() {
    }

    /**
     * 根据入参时间，取出所有周几
     */
    public static List<DayOfWeek> getWeekdaysBetween(LocalDateTime startDateTime, LocalDateTime endDateTime) {
        List<DayOfWeek> weekdays = new ArrayList<>();
        LocalDateTime currentDateTime = startDateTime;

        while (!currentDateTime.isAfter(endDateTime)) {
            weekdays.add(currentDateTime.getDayOfWeek());
            currentDateTime = currentDateTime.plusDays(1);
        }

        return weekdays;
    }

    /**
     * 根据入参时间，取出所有周几
     */
    public static List<LocalDate> getDatesBetween(LocalDateTime startDate, LocalDateTime endDate) {
        List<LocalDate> dates = new ArrayList<>();
        LocalDate currentDate = startDate.toLocalDate();

        while (!currentDate.isAfter(ChronoLocalDate.from(endDate))) {
            dates.add(currentDate);
            currentDate = currentDate.plusDays(1);
        }

        return dates;
    }

}
