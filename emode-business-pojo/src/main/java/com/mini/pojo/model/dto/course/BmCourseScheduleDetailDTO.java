package com.mini.pojo.model.dto.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author zhl
 * @create 2024/12/26 15:19
 */
@Data
public class BmCourseScheduleDetailDTO {

    @Schema(title = "主键id")
    private Long id;

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
    private List<BmCourseDetailDTO> curScheduleList;

}
