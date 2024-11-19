package com.mini.pojo.entity.manager;

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
 * 课表主表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "课表主表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_course_schedule")
public class BmCourseSchedule extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键 id")
    @TableId
    private Long id;

    @Schema(name = "课表名称")
    private String curScheduleName;

    @Schema(name = "课表开始时间")
    private LocalDateTime curScheduleStarTime;

    @Schema(name = "课表结束时间")
    private LocalDateTime curScheduleEndTime;
}
