package com.mini.pojo.model.vo.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 学生学校与年级常量数据表
 * </p>
 *
 * @author zhl
 * @since 2024-12-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmStudentConstantVo implements Serializable {

    @Schema(title = "主键 id")
    private Long id;

    @Schema(title = "类型school 学校  grade 年级 ")
    private String type;

    @Schema(title = "key 值")
    private String constantKey;

    @Schema(title = "计算值")
    private Integer constantValue;
}
