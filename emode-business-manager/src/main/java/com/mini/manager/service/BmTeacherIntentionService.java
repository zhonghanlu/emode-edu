package com.mini.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.pojo.entity.org.BmTeacherIntention;

import java.util.List;

/**
 * <p>
 * 教师意向时间关联表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-16
 */
public interface BmTeacherIntentionService extends IService<BmTeacherIntention> {

    /**
     * 根据教师id进行查询列表信息
     */
    List<BmTeacherIntention> getTeacherIntentionListByIdList(List<Long> teacherIdList);

    /**
     * 根据意向时间列表与教师id进行 筛选空闲意向教师列表
     */
    List<BmTeacherIntention> getTeacherIntentionListByListParam(List<Long> teacherIdList, List<IntentionCurTime> intentionCurTimeList);

    List<BmTeacherIntention> getClassIntentionListByIntentionCurTime(IntentionCurTime intentionCurTime);

    /**
     * 批量更新教师意向时间信息
     */
    void batchUpdateClassGrade(List<BmTeacherIntention> bmTeacherIntentionDbList);
}
