package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.manager.mapper.BmClassroomIntentionMapper;
import com.mini.manager.service.BmClassroomIntentionService;
import com.mini.pojo.entity.org.BmClassroomIntention;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 教室与意向时间关系表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-16
 */
@Service
@RequiredArgsConstructor
public class BmClassroomIntentionServiceImpl extends ServiceImpl<BmClassroomIntentionMapper, BmClassroomIntention> implements BmClassroomIntentionService {

    private final BmClassroomIntentionMapper bmClassroomIntentionMapper;

    @Override
    public List<BmClassroomIntention> getClassIntentionListByIdList(List<Long> bmClassroomIdList) {
        LambdaQueryWrapper<BmClassroomIntention> wrapper = Wrappers.lambdaQuery(BmClassroomIntention.class);
        wrapper.in(BmClassroomIntention::getClassroomId, bmClassroomIdList)
                .eq(BmClassroomIntention::getDelFlag, Delete.NO);
        return bmClassroomIntentionMapper.selectList(wrapper);
    }

    @Override
    public List<BmClassroomIntention> getClassIntentionListByListParam(List<Long> bmClassroomIdList, List<IntentionCurTime> intentionCurTimeList) {
        LambdaQueryWrapper<BmClassroomIntention> wrapper = Wrappers.lambdaQuery(BmClassroomIntention.class);
        wrapper.in(BmClassroomIntention::getClassroomId, bmClassroomIdList)
                .in(BmClassroomIntention::getIntentionCurTime, intentionCurTimeList)
                .isNull(BmClassroomIntention::getClassGradeId)
                .isNull(BmClassroomIntention::getClassGradeName)
                .eq(BmClassroomIntention::getDelFlag, Delete.NO);
        return bmClassroomIntentionMapper.selectList(wrapper);
    }

    @Override
    public List<BmClassroomIntention> getClassIntentionListByIntentionCurTime(IntentionCurTime intentionCurTime) {
        LambdaQueryWrapper<BmClassroomIntention> wrapper = Wrappers.lambdaQuery(BmClassroomIntention.class);
        wrapper.in(BmClassroomIntention::getIntentionCurTime, intentionCurTime)
                .isNull(BmClassroomIntention::getClassGradeId)
                .isNull(BmClassroomIntention::getClassGradeName)
                .eq(BmClassroomIntention::getDelFlag, Delete.NO);
        return bmClassroomIntentionMapper.selectList(wrapper);
    }
}
