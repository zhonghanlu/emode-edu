package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.manager.mapper.BmTeacherIntentionMapper;
import com.mini.manager.service.BmTeacherIntentionService;
import com.mini.pojo.entity.org.BmTeacherIntention;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 教师意向时间关联表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-16
 */
@Service
@RequiredArgsConstructor
public class BmTeacherIntentionServiceImpl extends ServiceImpl<BmTeacherIntentionMapper, BmTeacherIntention> implements BmTeacherIntentionService {

    private final BmTeacherIntentionMapper bmTeacherIntentionMapper;

    @Override
    public List<BmTeacherIntention> getTeacherIntentionListByIdList(List<Long> teacherIdList) {
        LambdaQueryWrapper<BmTeacherIntention> wrapper = Wrappers.lambdaQuery(BmTeacherIntention.class);
        wrapper.in(BmTeacherIntention::getTeacherId, teacherIdList)
                .eq(BmTeacherIntention::getDelFlag, Delete.NO);
        return bmTeacherIntentionMapper.selectList(wrapper);
    }

    @Override
    public List<BmTeacherIntention> getTeacherIntentionListByListParam(List<Long> teacherIdList, List<IntentionCurTime> intentionCurTimeList) {
        LambdaQueryWrapper<BmTeacherIntention> wrapper = Wrappers.lambdaQuery(BmTeacherIntention.class);
        wrapper.in(BmTeacherIntention::getTeacherId, teacherIdList)
                .in(BmTeacherIntention::getIntentionCurTime, intentionCurTimeList)
                .isNull(BmTeacherIntention::getClassGradeId)
                .isNull(BmTeacherIntention::getClassGradeName)
                .eq(BmTeacherIntention::getDelFlag, Delete.NO);
        return bmTeacherIntentionMapper.selectList(wrapper);
    }

    @Override
    public List<BmTeacherIntention> getClassIntentionListByIntentionCurTime(IntentionCurTime intentionCurTime) {
        LambdaQueryWrapper<BmTeacherIntention> wrapper = Wrappers.lambdaQuery(BmTeacherIntention.class);
        wrapper.in(BmTeacherIntention::getIntentionCurTime, intentionCurTime)
                .isNull(BmTeacherIntention::getClassGradeId)
                .isNull(BmTeacherIntention::getClassGradeName)
                .eq(BmTeacherIntention::getDelFlag, Delete.NO);
        return bmTeacherIntentionMapper.selectList(wrapper);
    }
}
