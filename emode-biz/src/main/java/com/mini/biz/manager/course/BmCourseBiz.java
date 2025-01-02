package com.mini.biz.manager.course;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.CourseFileType;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.*;
import com.mini.pojo.entity.course.BmCourseNotes;
import com.mini.pojo.entity.course.BmCourseStuPic;
import com.mini.pojo.entity.course.BmCourseStuSign;
import com.mini.pojo.entity.course.BmStuClassGrade;
import com.mini.pojo.mapper.course.BmCourseStructMapper;
import com.mini.pojo.model.dto.course.BmCourseDTO;
import com.mini.pojo.model.edit.course.*;
import com.mini.pojo.model.query.course.BmCourseQuery;
import com.mini.pojo.model.request.course.BmCourseRequest;
import com.mini.pojo.model.vo.course.BmCourseVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author zhl
 * @create 2024/11/20 13:41
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmCourseBiz {

    private final BmCourseService bmCourseService;

    private final BmCourseStuSignService bmCourseStuSignService;

    private final BmCourseStuPicService bmCourseStuPicService;

    private final BmCourseNotesService bmCourseNotesService;

    private final BmStuClassGradeService bmStuClassGradeService;

    /**
     * 分页
     */
    public IPage<BmCourseVo> page(BmCourseQuery query) {
        IPage<BmCourseDTO> page = bmCourseService.page(query);
        return page.convert(BmCourseStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmCourseVo getEntityById(Long id) {
        BmCourseDTO bmCourseDTO = bmCourseService.selectById(id);
        return BmCourseStructMapper.INSTANCE.dto2Vo(bmCourseDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmCourseRequest request) {
        bmCourseService.add(BmCourseStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmCourseService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmCourseEdit edit) {
        bmCourseService.update(BmCourseStructMapper.INSTANCE.edit2Dto(edit));
    }

    /**
     * 学生上课签到
     */
    @Transactional(rollbackFor = Exception.class)
    public void stuSignIn(BmCourseStuSignEdit edit) {
        Long courseId = edit.getCourseId();
        // 校验课程是否存在
        BmCourseDTO bmCourseDTO = checkCourseExist(courseId);

        List<BmCourseStuSignEdit.StuSignStatusInfo> stuSignStatusInfoList = edit.getStuSignStatusInfoList();

        if (CollectionUtils.isEmpty(stuSignStatusInfoList)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "签到信息不可为空");
        }

        // 根据班级判断当前是否为全部的学生签到信息
        LambdaQueryWrapper<BmStuClassGrade> wrapper = Wrappers.lambdaQuery(BmStuClassGrade.class);
        wrapper.eq(BmStuClassGrade::getClassGradeId, bmCourseDTO.getClassGradeId())
                .eq(BmStuClassGrade::getDelFlag, Delete.NO);
        long count = bmStuClassGradeService.count(wrapper);

        if (count != stuSignStatusInfoList.size()) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "签到信息不全,请重新键入全部学生签到信息");
        }

        // 根据课程id与学生id查询出所有信息，不存在的进行新增
        List<Long> stuIdList = stuSignStatusInfoList.stream()
                .map(BmCourseStuSignEdit.StuSignStatusInfo::getStuId).collect(Collectors.toList());
        List<BmCourseStuSign> bmCourseStuSignList = new ArrayList<>();
        Map<Long, BmCourseStuSign> bmCourseStuSignMap = bmCourseStuSignService.selectByIdListForMap(courseId, stuIdList);

        stuSignStatusInfoList.forEach(item -> {
            BmCourseStuSign bmCourseStuSign = new BmCourseStuSign();
            if (bmCourseStuSignMap.containsKey(item.getStuId())) {
                bmCourseStuSign = bmCourseStuSignMap.get(item.getStuId());
                bmCourseStuSign.setSignStatus(item.getSignStatus());
            } else {
                bmCourseStuSign.setId(IDGenerator.next());
                bmCourseStuSign.setCourseId(courseId);
                bmCourseStuSign.setStuId(item.getStuId());
                bmCourseStuSign.setSignStatus(item.getSignStatus());
                bmCourseStuSign.setDelFlag(Delete.NO);
            }
            bmCourseStuSignList.add(bmCourseStuSign);
        });

        boolean b = bmCourseStuSignService.saveOrUpdateBatch(bmCourseStuSignList);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "签到信息入库失败");
        }
    }

    /**
     * 学生课中情况
     */
    @Transactional(rollbackFor = Exception.class)
    public void stuClassPic(BmCourseStuClassPicEdit edit) {
        Long courseId = edit.getCourseId();
        // 校验课程信息
        checkCourseExist(courseId);

        // 对此课程的学生信息直接插入
        List<BmCourseStuClassPicEdit.StuClassPicInfo> stuClassPicInfoList = edit.getStuClassPicInfoList();

        List<BmCourseStuPic> bmCourseStuPicList = new ArrayList<>();
        stuClassPicInfoList.forEach(item -> item.getPicIdList().forEach(picId -> {
            BmCourseStuPic bmCourseStuPic = new BmCourseStuPic();
            bmCourseStuPic.setId(IDGenerator.next());
            bmCourseStuPic.setCourseId(courseId);
            bmCourseStuPic.setStuId(item.getStuId());
            bmCourseStuPic.setPicId(picId);
            bmCourseStuPic.setDelFlag(Delete.NO);
            bmCourseStuPicList.add(bmCourseStuPic);
        }));

        boolean b = bmCourseStuPicService.saveBatch(bmCourseStuPicList);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "批量新增失败");
        }

    }

    /**
     * 课堂讲义与作业
     */
    @Transactional(rollbackFor = Exception.class)
    public void stuClassNotes(BmCourseStuClassNotesEdit edit) {
        Long courseId = edit.getCourseId();
        // 校验课程是否存在
        checkCourseExist(courseId);

        List<BmCourseNotes> bmCourseNotesList = new ArrayList<>();
        edit.getHandoutsList().forEach(handoutsId -> {
            BmCourseNotes bmCourseNotes = new BmCourseNotes();
            bmCourseNotes.setId(IDGenerator.next());
            bmCourseNotes.setCourseId(courseId);
            bmCourseNotes.setFileType(CourseFileType.HANDOUTS);
            bmCourseNotes.setFileId(handoutsId);
            bmCourseNotes.setDelFlag(Delete.NO);
            bmCourseNotesList.add(bmCourseNotes);
        });

        edit.getTaskList().forEach(taskId -> {
            BmCourseNotes bmCourseNotes = new BmCourseNotes();
            bmCourseNotes.setId(IDGenerator.next());
            bmCourseNotes.setCourseId(courseId);
            bmCourseNotes.setFileType(CourseFileType.TASK);
            bmCourseNotes.setFileId(taskId);
            bmCourseNotes.setDelFlag(Delete.NO);
            bmCourseNotesList.add(bmCourseNotes);
        });

        boolean b = bmCourseNotesService.saveBatch(bmCourseNotesList);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "批量新增失败");
        }
    }

    /**
     * 课程结束
     * 1.签到学生扣除课时
     * 2.未签到学生录入补课数据
     * TODO
     */
    public void finish(BmCourseFinishEdit edit) {

    }

    /**
     * 校验课程是否存在  返回班级id
     */
    private BmCourseDTO checkCourseExist(Long courseId) {
        BmCourseDTO bmCourseDTO = bmCourseService.selectById(courseId);
        if (Objects.isNull(bmCourseDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "课程信息有误,请重新选择");
        }
        return bmCourseDTO;
    }
}
