package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.LastSql;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmClassGradeMapper;
import com.mini.manager.mapper.BmClassroomMapper;
import com.mini.manager.mapper.BmCourseMapper;
import com.mini.manager.mapper.BmTeacherMapper;
import com.mini.manager.service.BmCourseService;
import com.mini.pojo.entity.manager.BmCourse;
import com.mini.pojo.mapper.BmCourseStructMapper;
import com.mini.pojo.model.dto.BmCourseDTO;
import com.mini.pojo.model.query.BmCourseQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 课程表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmCourseServiceImpl extends ServiceImpl<BmCourseMapper, BmCourse> implements BmCourseService {

    private final BmCourseMapper bmCourseMapper;

    private final BmClassroomMapper bmClassroomMapper;

    private final BmTeacherMapper bmTeacherMapper;

    private final BmClassGradeMapper bmClassGradeMapper;

    @Override
    public void add(BmCourseDTO dto) {
        BmCourse bmCourse = BmCourseStructMapper.INSTANCE.dto2Entity(dto);

        bmCourse.setId(IDGenerator.next());
        bmCourse.setDelFlag(Delete.NO);

        // 校验课程名，教室，教师，班级是否存在
        checkExistParams(bmCourse);

        // 校验开始时间是否大于结束时间
        if (bmCourse.getCourseStartTime().isAfter(bmCourse.getCourseEndTime())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
        }

        int b = bmCourseMapper.insert(bmCourse);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmCourse bmCourse = CommonMybatisUtil.getById(id, bmCourseMapper);

        if (Objects.isNull(bmCourse)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmCourse.setDelFlag(Delete.YES);
        int b = bmCourseMapper.updateById(bmCourse);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmCourseDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmCourseMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmCourse bmCourse = BmCourseStructMapper.INSTANCE.dto2Entity(dto);

        // 校验课程名，教室，教师，班级是否存在
        checkExistParams(bmCourse);

        // 校验开始时间是否大于结束时间
        if (bmCourse.getCourseStartTime().isAfter(bmCourse.getCourseEndTime())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
        }

        int b1 = bmCourseMapper.updateById(bmCourse);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmCourseDTO selectById(long id) {
        return BmCourseStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmCourseMapper));
    }

    @Override
    public IPage<BmCourseDTO> page(BmCourseQuery query) {
        return bmCourseMapper.page(query, query.build());
    }


    /**
     * 校验名字是否重复，教室与教师是否存在
     */
    private void checkExistParams(BmCourse bmCourse) {
        // 查询名称是否重复
        LambdaQueryWrapper<BmCourse> wrapper = Wrappers.lambdaQuery(BmCourse.class);
        wrapper.eq(BmCourse::getCourseName, bmCourse.getCourseName())
                .eq(BmCourse::getDelFlag, Delete.NO)
                .last(LastSql.LIMIT_ONE);
        BmCourse course = bmCourseMapper.selectOne(wrapper);

        if (Objects.nonNull(course)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "课程名重复，请重新输入");
        }

        // 查询教师 与 教室是否存在
        boolean b = CommonMybatisUtil.isExistById(bmCourse.getTeaId(), bmTeacherMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前教师不存在");
        }

        boolean b1 = CommonMybatisUtil.isExistById(bmCourse.getClassRoomId(), bmClassroomMapper);

        if (!b1) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前教室不存在");
        }

        boolean b2 = CommonMybatisUtil.isExistById(bmCourse.getClassGradeId(), bmClassGradeMapper);

        if (!b2) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前班级不存在");
        }
    }

}
