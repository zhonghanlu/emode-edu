package com.mini.pojo.model.request.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;

import javax.validation.constraints.NotNull;

/**
 * @Author : zhl
 * @Date: 2025/1/11 16:08
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmClassGradeAddStuRequest {

    @NotNull(message = "学生 id 不可为空")
    @Schema(title = "学生 id")
    private Long stuId;

    @NotNull(message = "原班级 id 不可为空")
    @Schema(title = "原班级 id")
    private Long classGradeId;

    @NotNull(message = "学生类型不可为空")
    @Schema(title = "学生类型： 待分班数据传参：handleClass，已分班移除学生：alreadyOut")
    private StuType stuType;


    @Getter
    public enum StuType {
        /**
         * 待分班数据传参：handleClass
         * 已分班移除学生：alreadyOut
         */
        HANDLE_CLASS("handleClass"),
        ALREADY_OUT("alreadyOut");

        private String value;

        StuType(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }

}
