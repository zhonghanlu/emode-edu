package com.mini.pojo.model.request.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @Author : zhl
 * @Date: 2025/1/11 17:39
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmRepairCourseUploadFileRequest {

    @NotNull(message = "补课 id不可为空")
    @Schema(title = "补课 id")
    private Long repairId;

    @NotNull(message = "文件 id不可为空")
    @Schema(title = "文件 id")
    private List<Long> fileIdList;

}
