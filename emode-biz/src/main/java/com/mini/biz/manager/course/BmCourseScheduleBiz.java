package com.mini.biz.manager.course;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.constant.CourseTime;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.date.DateUtil;
import com.mini.manager.service.BmClassGradeService;
import com.mini.manager.service.BmClassroomService;
import com.mini.manager.service.BmCourseScheduleService;
import com.mini.manager.service.BmStuClassGradeService;
import com.mini.pojo.entity.course.BmStuClassGrade;
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
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;
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

    private final BmClassroomService bmClassroomService;

    private final BmStuClassGradeService bmStuClassGradeService;

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
        List<Long> classGradeIdList = bmClassGradeDTOList.stream().map(BmClassGradeDTO::getId).collect(Collectors.toList());
        Map<Long, List<BmStuClassGrade>> bmStuClassGradeMap = bmStuClassGradeService.mapForClassGradeIdList(classGradeIdList);

        bmClassGradeDTOList.forEach(item -> {
            BmCourseDTO bmCourseDTO = new BmCourseDTO();

            bmCourseDTO.setCourseType(item.getCurType());
            bmCourseDTO.setCourseName("");
            // 获取周
            String weekOne = IntentionCurTime.extractSubstringByDelimiter(item.getIntentionCurTime().getStringValue(), "_", 1);
            bmCourseDTO.setWeekOne(CourseTime.weekOneMap.get(weekOne));

            // 获取上课开始时间与结束时间
            String upOrDown = IntentionCurTime.extractSubstringByDelimiter(item.getIntentionCurTime().getStringValue(), "_", 2);
            String oneOrTwo = IntentionCurTime.extractSubstringByDelimiter(item.getIntentionCurTime().getStringValue(), "_", 3);
            List<LocalTime> localTimeList = CourseTime.courseTimeMap.get(upOrDown + oneOrTwo);
            if (CollectionUtils.isNotEmpty(localTimeList)) {
                // TODO 类型不一致
                bmCourseDTO.setCourseStartTime(LocalDateTime.from(localTimeList.get(0)));
                bmCourseDTO.setCourseEndTime(LocalDateTime.from(localTimeList.get(1)));
            }

            // 班级人数信息
            List<BmStuClassGrade> bmStuClassGradeList = bmStuClassGradeMap.get(item.getId());
            bmCourseDTO.setClassPersonSize(bmStuClassGradeList.size());
            bmCourseDTO.setClassRoomId(item.getClassroomId());
            bmCourseDTO.setClassRoomName(item.getClassroomName());
            bmCourseDTO.setTeaId(item.getTeaId());
            bmCourseDTO.setTeaName(item.getTeaName());
            bmCourseDTO.setClassGradeId(item.getId());
            bmCourseDTO.setClassGradeName(item.getClassGradeName());
        });


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
