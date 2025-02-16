package com.mini.pojo.model.dto.course;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.YesOrNo;
import com.mini.pojo.model.vo.course.BmRepairRelationFileVo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 补课数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmRepairCourseDTO {

    @Schema(name = "主键 id")
    private Long id;

    @Schema(name = "补课名称")
    private String repairName;

    @Schema(name = "课程类型")
    private CourseType curType;

    @Schema(name = "周几")
    private Integer weekOne;

    @Schema(name = "补课开始时间")
    private LocalDateTime repairStartTime;

    @Schema(name = "补课结束时间")
    private LocalDateTime repairEndTime;

    @Schema(name = "补课状态")
    private YesOrNo repairStatus;

    @Schema(title = "补课课堂作业与讲义")
    private List<BmRepairRelationFileVo> bmRepairRelationFileVoList;
}
