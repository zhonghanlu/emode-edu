package com.mini.pojo.entity.org;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.CourseType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 课时转换记录表
 * </p>
 *
 * @author zhl
 * @since 2025-01-09
 */
@Schema(description = "课时转换记录表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("bm_class_hour_convert")
public class BmClassHourConvert implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键id")
    @TableId
    private Long id;

    @Schema(title = "学生id")
    private Long stuId;

    @Schema(title = "fromid")
    private Long fromId;

    @Schema(title = "from课时")
    private Long fromClassHour;

    @Schema(title = "from类型")
    private CourseType fromCurType;

    @Schema(title = "toid")
    private Long toId;

    @Schema(title = "to课时")
    private Long toClassHour;

    @Schema(title = "to类型")
    private CourseType toCurType;

    @Schema(title = "操作时间")
    private LocalDateTime modifyTime;

    @Schema(title = "操作人")
    private Long modifyBy;

    @Schema(title = "操作人姓名")
    private String modifyName;


}
