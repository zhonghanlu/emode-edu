package com.mini.pojo.entity.edu;

import com.baomidou.mybatisplus.annotation.IdType;
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
 * 家教老师
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Schema(description = "家教老师")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_tutor_teacher")
public class BmTutorTeacher extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键 id")
    @TableId(value = "id", type = IdType.NONE)
    private Long id;

    @Schema(name = "教师 id")
    private Long teaId;

    @Schema(name = "家教老师名称")
    private String teaName;

    @Schema(name = "授课范围 python 、 c++等")
    private String giveClassType;

    @Schema(name = "空闲时间")
    private String leisureTime;

    @Schema(name = "教师详细介绍")
    private String tutorDetail;

}
