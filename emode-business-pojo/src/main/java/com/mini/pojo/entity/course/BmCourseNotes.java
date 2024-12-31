package com.mini.pojo.entity.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.enums.str.CourseFileType;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 课程讲义与课堂作业
 * </p>
 *
 * @author zhl
 * @since 2024-12-31
 */
@Schema(description = "课程讲义与课堂作业")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("bm_course_notes")
public class BmCourseNotes extends CommonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键id")
    @TableId
    private Long id;

    @Schema(title = "课程id")
    private Long courseId;

    @Schema(title = "文件类型：讲义；作业")
    private CourseFileType fileType;

    @Schema(title = "文件id")
    private Long fileId;

}
