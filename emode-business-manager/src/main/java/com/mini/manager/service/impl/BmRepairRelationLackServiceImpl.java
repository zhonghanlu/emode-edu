package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.manager.mapper.BmLackCourseMapper;
import com.mini.manager.mapper.BmRepairRelationLackMapper;
import com.mini.manager.service.BmRepairRelationLackService;
import com.mini.pojo.entity.course.BmLackCourse;
import com.mini.pojo.entity.course.BmRepairRelationLack;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 补课关联缺课数据 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2025-01-11
 */
@Service
@RequiredArgsConstructor
public class BmRepairRelationLackServiceImpl extends ServiceImpl<BmRepairRelationLackMapper, BmRepairRelationLack> implements BmRepairRelationLackService {

    private final BmLackCourseMapper bmLackCourseMapper;

    private final BmRepairRelationLackMapper bmRepairRelationLackMapper;

    @Override
    public List<BmLackCourse> selectBmLackCourseListByRepairId(Long repairId) {
        LambdaQueryWrapper<BmRepairRelationLack> wrapper = Wrappers.lambdaQuery(BmRepairRelationLack.class);
        wrapper.eq(BmRepairRelationLack::getRepairId, repairId);
        List<BmRepairRelationLack> bmRepairRelationLackList = bmRepairRelationLackMapper.selectList(wrapper);

        if (bmRepairRelationLackList != null && !bmRepairRelationLackList.isEmpty()) {
            List<Long> lackIdList = bmRepairRelationLackList.stream()
                    .map(BmRepairRelationLack::getLackId)
                    .collect(Collectors.toList());
            LambdaQueryWrapper<BmLackCourse> lackCourseWrapper = Wrappers.lambdaQuery(BmLackCourse.class);
            lackCourseWrapper.in(BmLackCourse::getId, lackIdList);
            return bmLackCourseMapper.selectList(lackCourseWrapper);
        }
        return Collections.emptyList();
    }
}
