package com.mini.pojo.model.edit.course;

import com.mini.common.enums.str.SignStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author zhl
 * @create 2024/12/31 13:27
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseStuSignEdit {

    /**
     * 课程id
     */
    @NotNull(message = "课程id不可为空")
    @Schema(title = "课程id")
    private Long courseId;

    /**
     * 学生签到状态信息
     */
    @NotNull(message = "学生签到信息不可为空")
    @Schema(title = "学生签到信息")
    private List<StuSignStatusInfo> stuSignStatusInfoList;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class StuSignStatusInfo {
        @Schema(title = "学生id")
        private Long stuId;

        @Schema(title = "签到状态")
        private SignStatus signStatus;
    }

}
