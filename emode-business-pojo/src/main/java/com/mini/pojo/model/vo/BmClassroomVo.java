package com.mini.pojo.model.vo;

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
@Schema(description = "教室展示")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmClassroomVo {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "教室名称")
    private String roomName;

    @Schema(title = "教室状态")
    private RoomStatus roomStatus;

    @Schema(title = "教室空间（最大容纳人数）")
    private Integer roomSize;

}
