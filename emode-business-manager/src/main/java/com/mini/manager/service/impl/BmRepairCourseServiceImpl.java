package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmRepairCourseMapper;
import com.mini.manager.service.BmRepairCourseService;
import com.mini.pojo.entity.course.BmRepairCourse;
import com.mini.pojo.mapper.course.BmRepairCourseStructMapper;
import com.mini.pojo.model.dto.course.BmRepairCourseDTO;
import com.mini.pojo.model.query.course.BmRepairCourseQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 补课数据表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmRepairCourseServiceImpl extends ServiceImpl<BmRepairCourseMapper, BmRepairCourse> implements BmRepairCourseService {

    private final BmRepairCourseMapper bmRepairCourseMapper;

    @Override
    public BmRepairCourse add(BmRepairCourseDTO dto) {
        BmRepairCourse bmRepairCourse = BmRepairCourseStructMapper.INSTANCE.dto2Entity(dto);

        // 校验时间
        if (bmRepairCourse.getRepairStartTime().isAfter(bmRepairCourse.getRepairEndTime())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
        }

        bmRepairCourse.setId(IDGenerator.next());
        bmRepairCourse.setDelFlag(Delete.NO);

        int b = bmRepairCourseMapper.insert(bmRepairCourse);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
        return bmRepairCourse;
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmRepairCourse bmRepairCourse = CommonMybatisUtil.getById(id, bmRepairCourseMapper);

        if (Objects.isNull(bmRepairCourse)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmRepairCourse.setDelFlag(Delete.YES);
        int b = bmRepairCourseMapper.updateById(bmRepairCourse);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmRepairCourseDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmRepairCourseMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmRepairCourse bmRepairCourse = BmRepairCourseStructMapper.INSTANCE.dto2Entity(dto);

        // 校验时间
        if (bmRepairCourse.getRepairStartTime().isAfter(bmRepairCourse.getRepairEndTime())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
        }

        int b1 = bmRepairCourseMapper.updateById(bmRepairCourse);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmRepairCourseDTO selectById(long id) {
        return bmRepairCourseMapper.selectDetailById(id);
    }

    @Override
    public IPage<BmRepairCourseDTO> page(BmRepairCourseQuery query) {
        return bmRepairCourseMapper.page(query, query.build());
    }
}
