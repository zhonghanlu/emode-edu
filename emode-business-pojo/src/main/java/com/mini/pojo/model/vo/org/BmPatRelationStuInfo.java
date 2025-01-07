package com.mini.pojo.model.vo.org;

import com.mini.pojo.model.vo.course.BmSimpleClassGradeVo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 关联的学生信息
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BmPatRelationStuInfo {
    @Schema(title = "学生id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "学生对应的班级信息")
    private List<BmSimpleClassGradeVo> bmClassGradeVoList;

    @Schema(title = "学生对应的课时信息")
    private List<BmStuClassHourVo> bmStuClassHourVoList;
}
