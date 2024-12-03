package com.mini.pojo.entity.edu;

import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.ApplyStatus;
import com.mini.common.enums.str.CourseType;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 家教申请
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Schema(description = "家教申请")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_tutor_apply")
public class BmTutorApply extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键 id")
    private Long id;

    @Schema(name = "申请人 id")
    private Long applyStuId;

    @Schema(name = "申请人姓名")
    private String applyName;

    @Schema(name = "申请科目")
    private CourseType applySubject;

    @Schema(name = "申请时间")
    private String applyTime;

    @Schema(name = "申请家教老师 id")
    private Long applyTutorId;

    @Schema(name = "申请家教老师姓名")
    private String applyTutorTeaName;

    @Schema(name = "消耗课时")
    private Integer expendClassHour;

    @Schema(name = "申请地址")
    private String applyAddress;

    @Schema(name = "申请状态")
    private ApplyStatus applyStatus;
}
