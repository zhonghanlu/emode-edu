package com.mini.pojo.entity.manager;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.RoomStatus;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 教室表
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Schema(description = "教室表")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_classroom")
public class BmClassroom extends CommonEntity {

    private static final long serialVersionUID = 1L;

    @Schema(name = "主键id")
    @TableId
    private Long id;

    @Schema(name = "教室名称")
    private String roomName;

    @Schema(name = "教室状态")
    private RoomStatus roomStatus;

    @Schema(name = "教室空间（最大容纳人数）")
    private Integer roomSize;

}
