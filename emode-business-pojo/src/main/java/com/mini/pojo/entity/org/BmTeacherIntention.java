package com.mini.pojo.entity.org;

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
 * 教师意向时间关联表
 * </p>
 *
 * @author zhl
 * @since 2024-12-16
 */

@Schema(description = "教师意向时间关联表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_classroom_intention")
public class BmTeacherIntention extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键 id")
    @TableId
    private Long id;

    @Schema(title = "教师主键 id")
    private Long teacherId;

    @Schema(title = "教师名称")
    private String teacherName;

    @Schema(title = "意向时间")
    private LocalDateTime intentionCurTime;

    @Schema(title = "班级 id")
    private Integer classGradeId;

    @Schema(title = "班级名称")
    private String classGradeName;

    @Schema(title = "创建人 id")
    private Long createBy;

    @Schema(title = "创建时间")
    private LocalDateTime createTime;

    @Schema(title = "更新人 id")
    private Long updateBy;

    @Schema(title = "更新时间")
    private LocalDateTime updateTime;

    @Schema(title = "删除标识")
    private Boolean delFlag;


}
