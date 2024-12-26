package com.mini.biz.manager.course;
import com.mini.common.enums.str.CourseType;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.date.DateUtil;
import com.mini.manager.service.BmClassGradeService;
import com.mini.manager.service.BmCourseScheduleService;
import com.mini.pojo.entity.course.BmCourse;
import com.mini.pojo.mapper.course.BmCourseScheduleStructMapper;
import com.mini.pojo.model.dto.course.BmClassGradeDTO;
import com.mini.pojo.model.dto.course.BmCourseDTO;
import com.mini.pojo.model.dto.course.BmCourseScheduleDTO;
import com.mini.pojo.model.edit.course.BmCourseScheduleEdit;
import com.mini.pojo.model.query.course.BmCourseScheduleQuery;
import com.mini.pojo.model.request.course.BmCourseScheduleRequest;
import com.mini.pojo.model.vo.course.BmCourseScheduleVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zhl
 * @create 2024/11/20 13:42
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmCourseScheduleBiz {

    private final BmCourseScheduleService bmCourseScheduleService;

    private final BmClassGradeService bmClassGradeService;

    /**
     * 分页
     */
    public IPage<BmCourseScheduleVo> page(BmCourseScheduleQuery query) {
        IPage<BmCourseScheduleDTO> page = bmCourseScheduleService.page(query);
        return page.convert(BmCourseScheduleStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条课表详情
     */
    public BmCourseScheduleVo getEntityById(Long id) {
        BmCourseScheduleDTO bmCourseScheduleDTO = bmCourseScheduleService.selectById(id);
        return BmCourseScheduleStructMapper.INSTANCE.dto2Vo(bmCourseScheduleDTO);
    }

    /**
     * 新增课表信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmCourseScheduleRequest request) {
        // 1.校验入参时间是否小于当前时间
        if (LocalDateTime.now().isAfter(request.getCurScheduleStarTime())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能小于当前时间");
        }
        // 2.校验入参时间是有有已分配课表
//        boolean flag = bmCourseScheduleService.existsTime(request.getCurScheduleStarTime(), request.getCurScheduleEndTime());
//        if (flag) {
//            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "时间段已存在课表");
//        }

        // 3.根据入参时间段 获取周次
        List<DayOfWeek> dayOfWeekList = DateUtil.getWeekdaysBetween(request.getCurScheduleStarTime(), request.getCurScheduleEndTime());
        // 3.1.根据周次获取对应意向上课枚举值
        List<String> weekOneList = dayOfWeekList.stream().map(item -> item.toString().toLowerCase()).collect(Collectors.toList());
        List<IntentionCurTime> intentionCurTimeList = IntentionCurTime.getListValByWeek(weekOneList);

        // 4.获取开启班级信息
        List<BmClassGradeDTO> bmClassGradeDTOList = bmClassGradeService.getNormalClassGradeList(intentionCurTimeList);
        // 5.根据班级创建课程信息
        BmCourseDTO bmCourseDTO = new BmCourseDTO();
        bmCourseDTO.setId(0L);
        bmCourseDTO.setCourseType(CourseType.PYTHON);
        bmCourseDTO.setCourseName("");
        bmCourseDTO.setWeekOne(0);
        bmCourseDTO.setCourseStartTime(LocalDateTime.now());
        bmCourseDTO.setCourseEndTime(LocalDateTime.now());
        bmCourseDTO.setClassPersonSize(0);
        bmCourseDTO.setClassRoomId(0L);
        bmCourseDTO.setClassRoomName("");
        bmCourseDTO.setTeaId(0L);
        bmCourseDTO.setTeaName("");
        bmCourseDTO.setClassGradeId(0L);
        bmCourseDTO.setClassGradeName("");


        // 3.封装课表基础信息 6.封装返回课表信息
        bmCourseScheduleService.add(BmCourseScheduleStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmCourseScheduleService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmCourseScheduleEdit edit) {
        bmCourseScheduleService.update(BmCourseScheduleStructMapper.INSTANCE.edit2Dto(edit));
    }

}
