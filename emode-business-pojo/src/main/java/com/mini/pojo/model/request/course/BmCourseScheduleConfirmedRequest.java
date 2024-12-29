package com.mini.pojo.model.request.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author zhl
 * @create 2024/12/27 16:43
 */
@Data
public class BmCourseScheduleConfirmedRequest {

    @NotBlank(message = "课表名称不能为空")
    @Schema(title = "课表名称")
    private String curScheduleName;

    @NotNull(message = "课程开始时间不能为空")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(title = "课表开始时间")
    private LocalDateTime curScheduleStarTime;

    @NotNull(message = "课程结束时间不能为空")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(title = "课表结束时间")
    private LocalDateTime curScheduleEndTime;

    @NotNull(message = "课程详细不能为空")
    @Schema(title = "详细课程信息")
    private List<BmCourseRequest> bmCourseRequestList;

}
