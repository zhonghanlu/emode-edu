package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.LastSql;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.SignStatus;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.*;
import com.mini.manager.service.BmCourseService;
import com.mini.pojo.entity.course.BmClassGrade;
import com.mini.pojo.entity.course.BmCourse;
import com.mini.pojo.entity.org.BmClassroom;
import com.mini.pojo.entity.org.BmTeacher;
import com.mini.pojo.mapper.course.BmCourseStructMapper;
import com.mini.pojo.model.dto.course.BmCourseDTO;
import com.mini.pojo.model.query.course.BmCourseQuery;
import com.mini.pojo.model.vo.course.BmCourseNotesVo;
import com.mini.pojo.model.vo.course.BmCourseStuSignVo;
import com.mini.pojo.model.vo.course.BmCourseVo;
import com.mini.pojo.model.vo.course.BmStuCourseVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import java.util.List;
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

    private final BmCourseStuPicMapper bmCourseStuPicMapper;

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

    @Override
    public void batchAdd(List<BmCourseDTO> bmCourseDTOList) {
        List<BmCourse> bmCourseList = BmCourseStructMapper.INSTANCE.dtoList2EntityList(bmCourseDTOList);

        // 此处数据量少，直接进行循环验证，后续改成批处理 TODO
        bmCourseList.forEach(item -> {
            checkExistParams(item);
            if (Objects.isNull(item.getId())) {
                item.setId(IDGenerator.next());
            }
            item.setDelFlag(Delete.NO);
            // 校验开始时间是否大于结束时间
            if (item.getCourseStartTime().isAfter(item.getCourseEndTime())) {
                throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
            }
        });

        boolean b = saveBatch(bmCourseList);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "批量新增失败");
        }
    }

    @Override
    public List<BmStuCourseVo> courseStuInfo(Long courseId) {
        return bmCourseMapper.courseStuInfo(courseId);
    }

    @Override
    public BmCourseVo selectDetailById(Long id) {
        BmCourseVo bmCourseVo = bmCourseMapper.selectDetailById(id);
        // 处理默认签到状态
        List<BmCourseStuSignVo> bmCourseStuSignVoList = bmCourseVo.getBmCourseStuSignVoList();
        if (CollectionUtils.isNotEmpty(bmCourseStuSignVoList)) {
            bmCourseStuSignVoList.forEach(item -> {
                SignStatus signStatus = item.getSignStatus();
                if (Objects.isNull(signStatus)) {
                    item.setSignStatus(SignStatus.WAIT_ARRIVED);
                }
            });
        }
        // 课堂作业与讲义
        List<BmCourseNotesVo> bmCourseNotesVoList = bmCourseMapper.selectNotesByCourseId(id);
        if (CollectionUtils.isNotEmpty(bmCourseNotesVoList)) {
            bmCourseVo.setBmCourseNotesVoList(bmCourseNotesVoList);
        }
        return bmCourseVo;
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

        // 查询教师
        if (Objects.nonNull(bmCourse.getTeaId())) {
            BmTeacher bmTeacher = CommonMybatisUtil.getById(bmCourse.getTeaId(), bmTeacherMapper);

            if (Objects.isNull(bmTeacher)) {
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前教师不存在");
            }
            bmCourse.setTeaName(bmTeacher.getTeaName());
        }

        // 教室是否存在
        if (Objects.nonNull(bmCourse.getClassRoomId())) {
            BmClassroom bmClassroom = CommonMybatisUtil.getById(bmCourse.getClassRoomId(), bmClassroomMapper);

            if (Objects.isNull(bmClassroom)) {
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前教室不存在");
            }
            bmCourse.setClassRoomName(bmClassroom.getRoomName());
        }

        // 查询班级是否存在
        if (Objects.nonNull(bmCourse.getClassGradeId())) {
            BmClassGrade bmClassGrade = CommonMybatisUtil.getById(bmCourse.getClassGradeId(), bmClassGradeMapper);

            if (Objects.isNull(bmClassGrade)) {
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前班级不存在");
            }
            bmCourse.setClassGradeName(bmClassGrade.getClassGradeName());
        }
    }

}
