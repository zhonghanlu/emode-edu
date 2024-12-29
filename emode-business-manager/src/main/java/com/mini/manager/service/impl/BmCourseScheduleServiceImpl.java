package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmCourseScheduleMapper;
import com.mini.manager.service.BmCourseScheduleService;
import com.mini.pojo.entity.course.BmCourseSchedule;
import com.mini.pojo.mapper.course.BmCourseScheduleStructMapper;
import com.mini.pojo.model.dto.course.BmCourseScheduleDTO;
import com.mini.pojo.model.query.course.BmCourseScheduleQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 课表主表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmCourseScheduleServiceImpl extends ServiceImpl<BmCourseScheduleMapper, BmCourseSchedule> implements BmCourseScheduleService {

    private final BmCourseScheduleMapper bmCourseScheduleMapper;

    @Override
    public void add(BmCourseScheduleDTO dto) {
        BmCourseSchedule bmCourseSchedule = BmCourseScheduleStructMapper.INSTANCE.dto2Entity(dto);

        // 校验时间
        if (bmCourseSchedule.getCurScheduleStarTime().isAfter(bmCourseSchedule.getCurScheduleEndTime())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
        }

        if (Objects.isNull(bmCourseSchedule.getId())) {
            bmCourseSchedule.setId(IDGenerator.next());
        }
        bmCourseSchedule.setDelFlag(Delete.NO);

        int b = bmCourseScheduleMapper.insert(bmCourseSchedule);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmCourseSchedule bmCourseSchedule = CommonMybatisUtil.getById(id, bmCourseScheduleMapper);

        if (Objects.isNull(bmCourseSchedule)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmCourseSchedule.setDelFlag(Delete.YES);
        int b = bmCourseScheduleMapper.updateById(bmCourseSchedule);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmCourseScheduleDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmCourseScheduleMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmCourseSchedule bmCourseSchedule = BmCourseScheduleStructMapper.INSTANCE.dto2Entity(dto);

        // 校验时间
        if (bmCourseSchedule.getCurScheduleStarTime().isAfter(bmCourseSchedule.getCurScheduleEndTime())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
        }

        int b1 = bmCourseScheduleMapper.updateById(bmCourseSchedule);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmCourseScheduleDTO selectById(long id) {
        return BmCourseScheduleStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmCourseScheduleMapper));
    }

    @Override
    public IPage<BmCourseScheduleDTO> page(BmCourseScheduleQuery query) {
        return bmCourseScheduleMapper.page(query, query.build());
    }

    @Override
    public boolean existsTime(LocalDateTime curScheduleStarTime) {
        LambdaQueryWrapper<BmCourseSchedule> wrapper = Wrappers.lambdaQuery(BmCourseSchedule.class);

        wrapper.gt(BmCourseSchedule::getCurScheduleEndTime, curScheduleStarTime)
                .eq(BmCourseSchedule::getDelFlag, Delete.NO);

        List<BmCourseSchedule> bmCourseScheduleList = bmCourseScheduleMapper.selectList(wrapper);
        return CollectionUtils.isNotEmpty(bmCourseScheduleList);
    }
}
