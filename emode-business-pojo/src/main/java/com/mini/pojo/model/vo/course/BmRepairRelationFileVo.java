package com.mini.pojo.model.vo.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @Author : zhl
 * @Date: 2025/2/16 11:42
 * @Description:
 */
@Data
public class BmRepairRelationFileVo {

    @Schema(title = "关联主键 id")
    private Long id;

    @Schema(title = "文件地址")
    private String fileUrl;

}
