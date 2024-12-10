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

/**
 * <p>
 * 家长和学生关联信息表
 * </p>
 *
 * @author zhl
 * @since 2024-12-10
 */
@Schema(description = "家长和学生关联信息表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_pat_stu_relation")
public class BmPatStuRelation extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键 id")
    @TableId
    private Long id;

    @Schema(title = "家长 id")
    private Long patriarchId;

    @Schema(title = "家长姓名")
    private String patriarchName;

    @Schema(title = "学生 id")
    private Long studentId;

    @Schema(title = "学生姓名")
    private String studentName;

}
