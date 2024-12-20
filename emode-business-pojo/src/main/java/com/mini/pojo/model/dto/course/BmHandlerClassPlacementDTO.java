package com.mini.pojo.model.dto.course;

import com.mini.common.enums.str.IntentionCurTime;
import com.mini.pojo.entity.org.BmClassroomIntention;
import com.mini.pojo.entity.org.BmTeacherIntention;
import lombok.*;

import java.util.List;

/**
 * @author zhl
 * @create 2024/12/20 9:37
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class BmHandlerClassPlacementDTO {

    /**
     * 意向时间
     */
    private IntentionCurTime intentionCurTime;

    /**
     * 可用教室
     */
    private List<BmClassroomIntention> classroomIntentionList;

    /**
     * 分配人员数据
     */
    private List<BmHandlerClassDTO> bmHandlerClassDTOList;

    /**
     * 可用教师
     */
    private List<BmTeacherIntention> bmTeacherIntentionList;

}
