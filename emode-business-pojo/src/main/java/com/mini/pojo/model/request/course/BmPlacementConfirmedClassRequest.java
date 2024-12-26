package com.mini.pojo.model.request.course;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.enums.str.ProductType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author zhl
 * @create 2024/12/24 17:06
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmPlacementConfirmedClassRequest {

    /**
     * 班级名称
     */
    @NotBlank(message = "班级名称不可为空")
    @Schema(title = "班级名称")
    private String classGradeName;

    /**
     * 意向时间
     */
    @NotNull(message = "意向时间不可为空")
    @Schema(title = "意向时间")
    private IntentionCurTime intentionCurTime;

    /**
     * 教师id
     */
    @NotNull(message = "教师id不可为空")
    @Schema(title = "教师id")
    private Long teacherId;

    /**
     * 教师名
     */
    @NotBlank(message = "教师名不可为空")
    @Schema(title = "教师名")
    private String teacherName;

    /**
     * 教室id
     */
    @NotNull(message = "教室id不可为空")
    @Schema(title = "教室id")
    private Long classroomId;

    /**
     * 教室名
     */
    @NotBlank(message = "教室名不可为空")
    @Schema(title = "教室名")
    private String classroomName;

    /**
     * 课程类型
     */
    @NotNull(message = "课程类型不可为空")
    @Schema(title = "课程类型")
    private CourseType curType;

    /**
     * 课程归属类型 长期 短期
     */
    @NotNull(message = "课程归属类型不能为空")
    @Schema(title = "课程归属类型 长期 短期")
    private ProductType productType;

    /**
     * 学生信息
     */
    @NotNull(message = "学生信息不可为空")
    @Schema(title = "学生信息")
    private List<BmPlacementConfirmedClassRequest.BmStuInfo> stuInfoList;

    @Data
    @NoArgsConstructor
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
