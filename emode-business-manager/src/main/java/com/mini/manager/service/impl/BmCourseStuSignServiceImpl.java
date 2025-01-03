package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.SignStatus;
import com.mini.manager.mapper.BmCourseStuSignMapper;
import com.mini.manager.service.BmCourseStuSignService;
import com.mini.pojo.entity.course.BmCourseStuSign;
import com.mini.pojo.model.edit.course.BmCourseStuSignEdit;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * <p>
 * 学生上课签到表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-31
 */
@Service
@RequiredArgsConstructor
public class BmCourseStuSignServiceImpl extends ServiceImpl<BmCourseStuSignMapper, BmCourseStuSign> implements BmCourseStuSignService {

    private final BmCourseStuSignMapper bmCourseStuSignMapper;

    @Override
    public int batchUpdate(Long courseId, List<BmCourseStuSignEdit.StuSignStatusInfo> stuSignStatusInfoList) {
        return bmCourseStuSignMapper.batchUpdate(courseId, stuSignStatusInfoList);
    }

    @Override
    public Map<Long, BmCourseStuSign> selectByIdListForMap(Long courseId, List<Long> stuIdList) {
        LambdaQueryWrapper<BmCourseStuSign> wrapper = Wrappers.lambdaQuery(BmCourseStuSign.class);
        wrapper.eq(BmCourseStuSign::getCourseId, courseId)
                .in(BmCourseStuSign::getStuId, stuIdList)
                .eq(BmCourseStuSign::getDelFlag, Delete.NO);
        List<BmCourseStuSign> bmCourseStuSignList1 = bmCourseStuSignMapper.selectList(wrapper);

        return bmCourseStuSignList1.stream()
                .collect(Collectors.toMap(BmCourseStuSign::getStuId, Function.identity()));
    }

    @Override
    public Map<SignStatus, List<BmCourseStuSign>> selectByCourseIdForMap(Long courseId) {
        LambdaQueryWrapper<BmCourseStuSign> wrapper = Wrappers.lambdaQuery(BmCourseStuSign.class);
        wrapper.eq(BmCourseStuSign::getCourseId, courseId)
                .eq(BmCourseStuSign::getDelFlag, Delete.NO);
        List<BmCourseStuSign> bmCourseStuSignList = bmCourseStuSignMapper.selectList(wrapper);
        return bmCourseStuSignList.stream()
                .collect(Collectors.groupingBy(BmCourseStuSign::getSignStatus));
    }
}
