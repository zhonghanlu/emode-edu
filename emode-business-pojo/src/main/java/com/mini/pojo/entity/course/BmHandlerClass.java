package com.mini.pojo.entity.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.HandlerClassStatus;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.enums.str.ProductType;
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
 * 待分班数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Schema(description = "待分班数据表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_handler_class")
public class BmHandlerClass extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键 id")
    @TableId
    private Long id;

    @Schema(name = "学生 id")
    private Long stuId;

    @Schema(name = "学生姓名")
    private String stuName;

    @Schema(title = "意向上课时间")
    private IntentionCurTime intentionCurTime;

    @Schema(name = "核销时间")
    private LocalDateTime consumeTime;

    @Schema(name = "课程语言类型")
    private CourseType curType;

    @Schema(name = "课程归属类型 长期 短期")
    private ProductType productType;

    @Schema(name = "分班状态：待分班、已分班")
    private HandlerClassStatus handlerClassStatus;

}
