package com.mini.pojo.entity.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 补课关联缺课数据
 * </p>
 *
 * @author zhl
 * @since 2025-01-11
 */
@Schema(description = "补课关联缺课数据")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("bm_repair_relation_lack")
public class BmRepairRelationLack implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键 id")
    @TableId
    private Long id;

    @Schema(title = "补课 id")
    private Long repairId;

    @Schema(title = "缺课 id")
    private Long lackId;


}
