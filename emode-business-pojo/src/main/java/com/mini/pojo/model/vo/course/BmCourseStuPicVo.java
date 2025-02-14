package com.mini.pojo.model.vo.course;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mini.common.model.CommonEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 学生上课图片信息
 * </p>
 *
 * @author zhl
 * @since 2024-12-31
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmCourseStuPicVo {

    @Schema(title = "图片关联主键id")
    private Long picId;

    @Schema(title = "学生id")
    private Long stuId;

    @Schema(title = "学生姓名")
    private String stuName;

    @Schema(title = "课中信息 图集合")
    private List<String> picUrlList;

}
