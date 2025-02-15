package com.mini.pojo.model.vo.course;

import com.mini.common.enums.str.CourseFileType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author : zhl
 * @Date: 2025/2/15 15:38
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BmCourseNotesVo {

    @Schema(title = "主键id")
    private Long id;

    @Schema(title = "文件类型：讲义；作业")
    private CourseFileType fileType;

    @Schema(title = "文件Url")
    private String fileUrl;

}
