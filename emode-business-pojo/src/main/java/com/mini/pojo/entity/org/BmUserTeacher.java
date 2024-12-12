package com.mini.pojo.entity.org;

import com.baomidou.mybatisplus.annotation.IdType;
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
 * 教师与系统账户关联关系表
 * </p>
 *
 * @author zhl
 * @since 2024-12-12
 */
@Schema(description = "教师与系统账户关联关系表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("bm_user_teacher")
public class BmUserTeacher implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键 id")
    @TableId(value = "id", type = IdType.NONE)
    private Long id;

    @Schema(title = "教师 id")
    private Long teaId;

    @Schema(title = "账户 id")
    private Long userId;


}
