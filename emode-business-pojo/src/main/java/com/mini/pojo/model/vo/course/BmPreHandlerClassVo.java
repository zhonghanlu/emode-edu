package com.mini.pojo.model.vo.course;

import com.mini.common.enums.str.IntentionCurTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author zhl
 * @create 2024/12/24 9:58
 * 预分班vo
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPreHandlerClassVo {

    /**
     * 班级名称
     */
    @Schema(title = "班级名称")
    private String classGradeName;

    /**
     * 班级容量大小
     */
    @Schema(title = "班级容量大小")
    private Integer roomSize;

    /**
     * 意向时间
     */
    @Schema(title = "意向时间")
    private IntentionCurTime intentionCurTime;

    /**
     * 教师id
     */
    @Schema(title = "教师id")
    private Long teacherId;

    /**
     * 教师名
     */
    @Schema(title = "教师名")
    private String teacherName;

    /**
     * 教室id
     */
    @Schema(title = "教室id")
    private Long classroomId;

    /**
     * 教室名
     */
    @Schema(title = "教室名")
    private String classroomName;

    /**
     * 学生信息
     */
    @Schema(title = "学生信息")
    private List<BmStuInfo> stuInfoList;

    @Data
    @AllArgsConstructor
    @EqualsAndHashCode(callSuper = false)
    public static class BmStuInfo {
        /**
         * 待分班id
         */
        @Schema(title = "待分班id")
        private Long handlerId;

        /**
         * 学生id
         */
        @Schema(title = "学生id")
        private Long stuId;

        /**
         * 学生姓名
         */
        @Schema(title = "学生姓名")
        private String stuName;
    }
}
