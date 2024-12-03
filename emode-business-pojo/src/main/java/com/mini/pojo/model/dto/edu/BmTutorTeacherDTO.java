package com.mini.pojo.model.dto.edu;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 家教老师
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmTutorTeacherDTO {

    @Schema(name = "主键 id")
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
