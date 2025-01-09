package com.mini.pojo.model.vo.org;

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
@EqualsAndHashCode(callSuper = false)
public class BmClassHourConvertVo {

    @Schema(title = "主键id")
    @TableId
    private Long id;

    @Schema(title = "from课时")
    private Long fromClassHour;

    @Schema(title = "from类型")
    private CourseType fromCurType;

    @Schema(title = "to课时")
    private Long toClassHour;

    @Schema(title = "to类型")
    private CourseType toCurType;

    @Schema(title = "操作时间")
    private LocalDateTime modifyTime;

    @Schema(title = "操作人姓名")
    private String modifyName;
}
