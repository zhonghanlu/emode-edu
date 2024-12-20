package com.mini.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.pojo.entity.org.BmClassroomIntention;

import java.util.List;

/**
 * <p>
 * 教室与意向时间关系表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-16
 */
public interface BmClassroomIntentionService extends IService<BmClassroomIntention> {

    /**
     * 根据教室id查询意向时间列表
     */
    List<BmClassroomIntention> getClassIntentionListByIdList(List<Long> bmClassroomIdList);

    /**
     * 教室id和意向时间列表查询 满足的意向教室列表
     */
    List<BmClassroomIntention> getClassIntentionListByListParam(List<Long> bmClassroomIdList, List<IntentionCurTime> intentionCurTimeList);

    /**
     * 根据意向时间查询 所有满足的教室
     */
    List<BmClassroomIntention> getClassIntentionListByIntentionCurTime(IntentionCurTime intentionCurTime);
}
