package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.enums.number.Delete;
import com.mini.manager.mapper.BmStuClassGradeMapper;
import com.mini.manager.service.BmStuClassGradeService;
import com.mini.pojo.entity.course.BmStuClassGrade;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 学生和班级关系 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-20
 */
@Service
@RequiredArgsConstructor
public class BmStuClassGradeServiceImpl extends ServiceImpl<BmStuClassGradeMapper, BmStuClassGrade> implements BmStuClassGradeService {

    private final BmStuClassGradeMapper bmStuClassGradeMapper;

    @Override
    public Map<Long, List<BmStuClassGrade>> mapForClassGradeIdList(List<Long> classGradeIdList) {
        LambdaQueryWrapper<BmStuClassGrade> wrapper = Wrappers.lambdaQuery(BmStuClassGrade.class);
        wrapper.in(BmStuClassGrade::getClassGradeId, classGradeIdList)
                .eq(BmStuClassGrade::getDelFlag, Delete.NO);
        List<BmStuClassGrade> bmStuClassGradeList = bmStuClassGradeMapper.selectList(wrapper);
        return bmStuClassGradeList.stream().collect(Collectors.groupingBy(BmStuClassGrade::getClassGradeId));
    }
}
