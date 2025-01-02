package com.mini.biz.manager.course;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.constant.CourseTime;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.CourseStatus;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.date.DateUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.*;
import com.mini.pojo.entity.course.BmCourseScheduleItem;
import com.mini.pojo.entity.course.BmStuClassGrade;
import com.mini.pojo.mapper.course.BmCourseScheduleStructMapper;
import com.mini.pojo.mapper.course.BmCourseStructMapper;
import com.mini.pojo.model.dto.course.BmClassGradeDTO;
import com.mini.pojo.model.dto.course.BmCourseDTO;
import com.mini.pojo.model.dto.course.BmCourseScheduleDTO;
import com.mini.pojo.model.edit.course.BmCourseScheduleEdit;
import com.mini.pojo.model.query.course.BmCourseScheduleQuery;
import com.mini.pojo.model.request.course.BmCourseRequest;
import com.mini.pojo.model.request.course.BmCourseScheduleConfirmedRequest;
import com.mini.pojo.model.request.course.BmCourseScheduleRequest;
import com.mini.pojo.model.vo.course.BmCourseScheduleNewVo;
import com.mini.pojo.model.vo.course.BmCourseScheduleVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;
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

    private final BmStuClassGradeService bmStuClassGradeService;

    private final BmCourseScheduleItemService bmCourseScheduleItemService;

    private final BmCourseService bmCourseService;

    private final BmCourseStuSignService bmCourseStuSignService;

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
    public BmCourseScheduleNewVo previewCourseSchedule(BmCourseScheduleRequest request) {
        LocalDateTime curScheduleStarTime = request.getCurScheduleStarTime();
        LocalDateTime curScheduleEndTime = request.getCurScheduleEndTime();
        Map<LocalDate, List<BmCourseScheduleNewVo.BmCourseNewVo>> curScheduleMap = new HashMap<>();

        // 1.校验入参时间是否小于当前时间
        checkCourseScheduleTime(curScheduleStarTime, curScheduleEndTime);

        // 3.根据入参时间段 获取周次
        List<DayOfWeek> dayOfWeekList = DateUtil.getWeekdaysBetween(curScheduleStarTime, curScheduleEndTime);
        // 3.1.根据周次获取对应意向上课枚举值
        List<String> weekOneList = dayOfWeekList.stream().map(item -> item.toString().toLowerCase()).collect(Collectors.toList());
        List<IntentionCurTime> intentionCurTimeList = IntentionCurTime.getListValByWeek(weekOneList);
        List<LocalDate> datesBetween = DateUtil.getDatesBetween(curScheduleStarTime, curScheduleEndTime);

        // 4.获取开启班级信息
        List<BmClassGradeDTO> bmClassGradeDTOList = bmClassGradeService.getNormalClassGradeList(intentionCurTimeList);

        if (CollectionUtils.isEmpty(bmClassGradeDTOList)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前时间段没有需要分班的数据");
        }

        // 根据意向时间进行分组
        Map<IntentionCurTime, List<BmClassGradeDTO>> intentionCurTimeMap = bmClassGradeDTOList.stream()
                .collect(Collectors.groupingBy(BmClassGradeDTO::getIntentionCurTime));

        // 5.根据班级创建课程信息
        List<Long> classGradeIdList = bmClassGradeDTOList.stream().map(BmClassGradeDTO::getId).collect(Collectors.toList());
        Map<Long, List<BmStuClassGrade>> bmStuClassGradeMap = bmStuClassGradeService.mapForClassGradeIdList(classGradeIdList);

        // 封装数据
        handlerCourseSchedule(datesBetween, intentionCurTimeMap, bmStuClassGradeMap, curScheduleMap);

        return BmCourseScheduleNewVo.builder()
                .curScheduleName("")
                .curScheduleStarTime(curScheduleStarTime)
                .curScheduleEndTime(curScheduleEndTime)
                .curScheduleMap(curScheduleMap)
                .build();
    }

    /**
     * 校验课表开始时间与结束时间
     */
    private void checkCourseScheduleTime(LocalDateTime curScheduleStarTime, LocalDateTime curScheduleEndTime) {
        if (LocalDateTime.now().isAfter(curScheduleStarTime)) {
            // 无法分配当天的课表
            LocalDate startDate = curScheduleStarTime.toLocalDate();
            if (LocalDate.now().equals(startDate)) {
                throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "无法分配当天课表");
            }
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能小于当前时间");
        }

        if (curScheduleStarTime.isAfter(curScheduleEndTime)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
        }

        // 2.校验入参时间是有有已分配课表
        boolean flag = bmCourseScheduleService.existsTime(curScheduleStarTime);
        if (flag) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "时间段已存在课表");
        }
    }

    /**
     *
     */
    private void handlerCourseSchedule(List<LocalDate> datesBetween, Map<IntentionCurTime, List<BmClassGradeDTO>> intentionCurTimeMap, Map<Long, List<BmStuClassGrade>> bmStuClassGradeMap, Map<LocalDate, List<BmCourseScheduleNewVo.BmCourseNewVo>> curScheduleMap) {
        datesBetween.forEach(date -> {
            List<BmCourseScheduleNewVo.BmCourseNewVo> bmCourseNewVoList = new ArrayList<>();
            List<IntentionCurTime> intentionCurTimeList = IntentionCurTime.getValByTime(date);
            // 根据时间 换周几，根据周几取对应的意向时间
            List<BmClassGradeDTO> bmClassGradeDTOList1 = new ArrayList<>();
            intentionCurTimeMap.forEach((key, val) -> {
                if (intentionCurTimeList.contains(key)) {
                    bmClassGradeDTOList1.addAll(val);
                }
            });

            if (CollectionUtils.isNotEmpty(bmClassGradeDTOList1)) {
                // 封装数据
                bmClassGradeDTOList1.forEach(item -> {
                    BmCourseScheduleNewVo.BmCourseNewVo bmCourseNewVo = new BmCourseScheduleNewVo.BmCourseNewVo();
                    bmCourseNewVo.setCourseType(item.getCurType());
                    bmCourseNewVo.setCourseName("");

                    String upOrDown = IntentionCurTime.extractSubstringByDelimiter(item.getIntentionCurTime().getStringValue(), "_", 2);
                    String oneOrTwo = IntentionCurTime.extractSubstringByDelimiter(item.getIntentionCurTime().getStringValue(), "_", 3);
                    List<LocalTime> localTimeList = CourseTime.courseTimeMap.get(upOrDown + "_" + oneOrTwo);
                    if (CollectionUtils.isNotEmpty(localTimeList)) {
                        bmCourseNewVo.setCourseStartTime(LocalDateTime.of(date, localTimeList.get(0)));
                        bmCourseNewVo.setCourseEndTime(LocalDateTime.of(date, localTimeList.get(1)));
                    }

                    List<BmStuClassGrade> bmStuClassGradeList = bmStuClassGradeMap.get(item.getId());
                    bmCourseNewVo.setClassPersonSize(bmStuClassGradeList.size());
                    bmCourseNewVo.setClassRoomId(item.getClassroomId());
                    bmCourseNewVo.setClassRoomName(item.getClassroomName());
                    bmCourseNewVo.setTeaId(item.getTeaId());
                    bmCourseNewVo.setTeaName(item.getTeaName());
                    bmCourseNewVo.setClassGradeId(item.getId());
                    bmCourseNewVo.setClassGradeName(item.getClassGradeName());

                    bmCourseNewVoList.add(bmCourseNewVo);
                });
            }
            // 塞入汇总数据 根据课程开始时间进行排序
            bmCourseNewVoList.sort(Comparator.comparing(BmCourseScheduleNewVo.BmCourseNewVo::getCourseStartTime));
            curScheduleMap.put(date, bmCourseNewVoList);
        });
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

    /**
     * 确认课表信息，入库
     */
    @Transactional(rollbackFor = Exception.class)
    public void confirmedCourseSchedule(BmCourseScheduleConfirmedRequest request) {
        LocalDateTime curScheduleStarTime = request.getCurScheduleStarTime();
        LocalDateTime curScheduleEndTime = request.getCurScheduleEndTime();
        // 1.根据入参数据进行基础校验参数
        checkCourseScheduleTime(curScheduleStarTime, curScheduleEndTime);
        // 2.封装课表的主表与从表信息
        BmCourseScheduleDTO bmCourseScheduleDTO = new BmCourseScheduleDTO();
        bmCourseScheduleDTO.setId(IDGenerator.next());
        bmCourseScheduleDTO.setCurScheduleName(request.getCurScheduleName());
        bmCourseScheduleDTO.setCurScheduleStarTime(curScheduleStarTime);
        bmCourseScheduleDTO.setCurScheduleEndTime(curScheduleEndTime);
        bmCourseScheduleService.add(bmCourseScheduleDTO);

        // 3.封装课程信息
        List<BmCourseRequest> bmCourseRequestList = request.getBmCourseRequestList();
        List<BmCourseDTO> bmCourseDTOList = BmCourseStructMapper.INSTANCE.reqList2DtoList(bmCourseRequestList);
        bmCourseDTOList.forEach(item -> {
            item.setCourseStatus(CourseStatus.WAIT_FOR_CLASS);
            item.setWeekOne(item.getCourseStartTime().getDayOfWeek().getValue());
            item.setId(IDGenerator.next());
        });
        bmCourseService.batchAdd(bmCourseDTOList);

        // 课表从表
        List<BmCourseScheduleItem> bmCourseScheduleItemList = new ArrayList<>();
        bmCourseDTOList.forEach(item -> {
            BmCourseScheduleItem bmCourseScheduleItem = new BmCourseScheduleItem();
            bmCourseScheduleItem.setId(IDGenerator.next());
            bmCourseScheduleItem.setRangeStartTime(item.getCourseStartTime());
            bmCourseScheduleItem.setRangeEndTime(item.getCourseEndTime());
            bmCourseScheduleItem.setCurId(item.getId());
            bmCourseScheduleItem.setCurName(item.getCourseName());
            bmCourseScheduleItem.setCurScheduleId(bmCourseScheduleDTO.getId());
            bmCourseScheduleItem.setSort(0);
            bmCourseScheduleItem.setDelFlag(Delete.NO);
            bmCourseScheduleItemList.add(bmCourseScheduleItem);
        });
        // 事物失效问题  TODO
        boolean b = bmCourseScheduleItemService.saveBatch(bmCourseScheduleItemList);
        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "批量新增失败");
        }
    }
}
