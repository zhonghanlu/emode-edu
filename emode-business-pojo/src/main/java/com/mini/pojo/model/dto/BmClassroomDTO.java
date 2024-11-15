package com.mini.pojo.model.dto;

import com.mini.common.enums.str.RoomStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 教室表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmClassroomDTO {

    @Schema(name = "主键id")
    private Long id;

    @Schema(name = "教室名称")
    private String roomName;

    @Schema(name = "教室状态")
    private RoomStatus roomStatus;

    @Schema(name = "教室空间（最大容纳人数）")
    private Integer roomSize;

}
