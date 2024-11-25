package com.mini.pojo.model.request.org;

import com.mini.common.enums.str.RoomStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 教室表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "教室请求")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmClassroomRequest {

    @NotBlank(message = "教室名称不可为空")
    @Schema(title = "教室名称")
    private String roomName;

    @Schema(title = "教室状态")
    private RoomStatus roomStatus;

    @Schema(title = "教室空间（最大容纳人数）")
    private Integer roomSize;

}
