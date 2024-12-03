package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmClassGradeMapper;
import com.mini.manager.mapper.BmCourseMapper;
import com.mini.manager.mapper.BmLackCourseMapper;
import com.mini.manager.mapper.BmStudentMapper;
import com.mini.manager.service.BmLackCourseService;
import com.mini.pojo.entity.course.BmClassGrade;
import com.mini.pojo.entity.course.BmCourse;
import com.mini.pojo.entity.course.BmLackCourse;
import com.mini.pojo.entity.org.BmStudent;
import com.mini.pojo.mapper.course.BmLackCourseStructMapper;
import com.mini.pojo.model.dto.course.BmLackCourseDTO;
import com.mini.pojo.model.query.course.BmLackCourseQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 缺课数据表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmLackCourseServiceImpl extends ServiceImpl<BmLackCourseMapper, BmLackCourse> implements BmLackCourseService {

    private final BmLackCourseMapper bmLackCourseMapper;

    private final BmClassGradeMapper bmClassGradeMapper;

    private final BmCourseMapper bmCourseMapper;

    private final BmStudentMapper bmStudentMapper;

    @Override
    public void add(BmLackCourseDTO dto) {
        BmLackCourse bmLackCourse = BmLackCourseStructMapper.INSTANCE.dto2Entity(dto);

        // 校验班级 课程 学生 是否存在
        checkExistParams(bmLackCourse);

        // 校验开始时间是否大于结束时间
        if (bmLackCourse.getLackStartTime().isAfter(bmLackCourse.getLackEndTime())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
        }

        bmLackCourse.setId(IDGenerator.next());
        bmLackCourse.setDelFlag(Delete.NO);

        int b = bmLackCourseMapper.insert(bmLackCourse);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmLackCourse bmLackCourse = CommonMybatisUtil.getById(id, bmLackCourseMapper);

        if (Objects.isNull(bmLackCourse)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmLackCourse.setDelFlag(Delete.YES);
        int b = bmLackCourseMapper.updateById(bmLackCourse);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmLackCourseDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmLackCourseMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmLackCourse bmLackCourse = BmLackCourseStructMapper.INSTANCE.dto2Entity(dto);

        // 校验班级 课程 学生 是否存在
        checkExistParams(bmLackCourse);

        // 校验开始时间是否大于结束时间
        if (bmLackCourse.getLackStartTime().isAfter(bmLackCourse.getLackEndTime())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
        }

        int b1 = bmLackCourseMapper.updateById(bmLackCourse);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmLackCourseDTO selectById(long id) {
        return BmLackCourseStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmLackCourseMapper));
    }

    @Override
    public IPage<BmLackCourseDTO> page(BmLackCourseQuery query) {
        return bmLackCourseMapper.page(query, query.build());
    }


    /**
     * 校验班级课程学生是否存在
     */
    private void checkExistParams(BmLackCourse bmLackCourse) {
        // 课程
        if (Objects.nonNull(bmLackCourse.getCurId())) {
            BmCourse bmCourse = CommonMybatisUtil.getById(bmLackCourse.getCurId(), bmCourseMapper);

            if (Objects.isNull(bmCourse)) {
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前课程不存在");
            }
            bmLackCourse.setCurName(bmCourse.getCourseName());
        }

        // 学生
        if (Objects.nonNull(bmLackCourse.getStuId())) {
            BmStudent bmStudent = CommonMybatisUtil.getById(bmLackCourse.getStuId(), bmStudentMapper);

            if (Objects.isNull(bmStudent)) {
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前学生不存在");
            }
            bmLackCourse.setStuName(bmStudent.getStuName());
        }

        // 班级
        if (Objects.nonNull(bmLackCourse.getClassGradeId())) {
            BmClassGrade bmClassGrade = CommonMybatisUtil.getById(bmLackCourse.getClassGradeId(), bmClassGradeMapper);

            if (Objects.isNull(bmClassGrade)) {
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前班级不存在");
            }
            bmLackCourse.setClassGradeName(bmClassGrade.getClassGradeName());
        }
    }
}
