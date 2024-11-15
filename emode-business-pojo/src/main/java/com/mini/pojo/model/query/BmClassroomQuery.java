package com.mini.pojo.model.query;

import com.mini.common.enums.str.RoomStatus;
import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.Parameter;
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
@Schema(description = "教室查询")
@Data
@EqualsAndHashCode(callSuper = false)
public class BmClassroomQuery extends PageQuery {

    @Parameter(description = "教室名称")
    private String roomName;

    @Parameter(description = "教室状态")
    private RoomStatus roomStatus;

    @Parameter(description = "教室空间（最大容纳人数）")
    private Integer roomSize;

}
