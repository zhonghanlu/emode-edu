package com.mini.pojo.entity.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 课表内容主体表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "课表内容主体表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_course_schedule_item")
public class BmCourseScheduleItem extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键 id")
    @TableId
    private Long id;

    @Schema(name = "开始时间")
    private LocalDateTime rangeStartTime;

    @Schema(name = "结束时间")
    private LocalDateTime rangeEndTime;

    @Schema(name = "课程 id")
    private Long curId;

    @Schema(name = "课程名称")
    private String curName;

    @Schema(name = "课表主体 id")
    private Long curScheduleId;

    @Schema(name = "排序")
    private Integer sort;
}
