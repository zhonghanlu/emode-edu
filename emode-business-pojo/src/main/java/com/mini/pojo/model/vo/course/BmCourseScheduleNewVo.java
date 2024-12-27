package com.mini.pojo.model.vo.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 * @author zhl
 * @create 2024/12/26 15:19
 */
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
public class BmCourseScheduleNewVo {

    @Schema(title = "课表名称")
    private String curScheduleName;

    @Schema(title = "课表开始时间")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime curScheduleStarTime;

    @Schema(title = "课表结束时间")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime curScheduleEndTime;

    @Schema(title = "课表详细信息系")
    private Map<LocalDate, List<BmCourseNewVo>> curScheduleMap;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class BmCourseNewVo {

        @Schema(title = "课程类型")
        private CourseType courseType;

        @Schema(title = "课程名称")
        private String courseName;

        @Schema(title = "课程开始时间")
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
        @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private LocalDateTime courseStartTime;

        @Schema(title = "课程结束时间")
        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
        @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private LocalDateTime courseEndTime;

        @Schema(title = "班级人数")
        private Integer classPersonSize;

        @Schema(title = "教室 id")
        private Long classRoomId;

        @Schema(title = "教室名称")
        private String classRoomName;

        @Schema(title = "教师 id")
        private Long teaId;

        @Schema(title = "教师名称")
        private String teaName;

        @Schema(title = "班级 id")
        private Long classGradeId;

        @Schema(title = "班级名称")
        private String classGradeName;

    }

}
