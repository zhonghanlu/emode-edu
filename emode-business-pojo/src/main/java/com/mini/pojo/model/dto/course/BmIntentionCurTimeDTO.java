package com.mini.pojo.model.dto.course;

import com.mini.common.enums.str.IntentionCurPeriodTime;
import com.mini.common.enums.str.IntentionCurWeekTime;
import lombok.*;

/**
 * @Author : zhl
 * @Date: 2024/12/14 13:48
 * @Description: 意向上课时间
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class BmIntentionCurTimeDTO {

    /**
     * 意向上课时间 周
     */
    private IntentionCurWeekTime intentionCurWeekTime;

    /**
     * 意向上课时间 时间段
     */
    private IntentionCurPeriodTime intentionCurPeriodTime;

}
