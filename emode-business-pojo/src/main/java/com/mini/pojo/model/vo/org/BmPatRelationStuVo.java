package com.mini.pojo.model.vo.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;

import java.util.List;

/**
 * @author zhl
 * @create 2025/1/7 10:17
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class BmPatRelationStuVo {

    @Schema(title = "家长id")
    private Long patId;

    @Schema(title = "家长姓名")
    private String patName;

    @Schema(title = "关联的学生信息")
    private List<BmPatRelationStuInfo> stuInfoList;
}
