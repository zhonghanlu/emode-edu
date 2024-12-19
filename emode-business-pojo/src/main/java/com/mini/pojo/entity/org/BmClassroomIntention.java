package com.mini.pojo.entity.org;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 教室与意向时间关系表
 * </p>
 *
 * @author zhl
 * @since 2024-12-16
 */
@Schema(description = "教室与意向时间关系表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_classroom_intention")
public class BmClassroomIntention extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键 id")
    @TableId
    private Long id;

    @Schema(title = "教室 id")
    private Long classroomId;

    @Schema(title = "教室名称")
    private String classroomName;

    @Schema(title = "房间大小")
    private Integer roomSize;

    @Schema(title = "意向上课时间")
    private IntentionCurTime intentionCurTime;

    @Schema(title = "班级 id")
    private Long classGradeId;

    @Schema(title = "班级名称")
    private String classGradeName;

}
