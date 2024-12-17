package com.mini.biz.manager.course;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.manager.service.*;
import com.mini.pojo.entity.org.BmClassroom;
import com.mini.pojo.entity.org.BmClassroomIntention;
import com.mini.pojo.entity.org.BmTeacher;
import com.mini.pojo.entity.org.BmTeacherIntention;
import com.mini.pojo.mapper.course.BmHandlerClassStructMapper;
import com.mini.pojo.model.dto.course.BmHandlerClassDTO;
import com.mini.pojo.model.dto.org.BmClassroomDTO;
import com.mini.pojo.model.dto.org.BmTeacherDTO;
import com.mini.pojo.model.edit.course.BmHandlerClassEdit;
import com.mini.pojo.model.query.course.BmHandlerClassQuery;
import com.mini.pojo.model.request.course.BmHandlerClassRequest;
import com.mini.pojo.model.vo.course.BmHandlerClassVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author zhl
 * @create 2024/11/20 13:42
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmHandlerClassBiz {

    private final BmHandlerClassService bmHandlerClassService;

    private final BmTeacherService bmTeacherService;

    private final BmClassroomService bmClassroomService;

    private final BmClassroomIntentionService bmClassroomIntentionService;

    private final BmTeacherIntentionService bmTeacherIntentionService;

    public static final String PLACEHOLDER = ":";

    /**
     * 分页
     */
    public IPage<BmHandlerClassVo> page(BmHandlerClassQuery query) {
        IPage<BmHandlerClassDTO> page = bmHandlerClassService.page(query);
        return page.convert(BmHandlerClassStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取待分班详情
     */
    public BmHandlerClassVo getEntityById(Long id) {
        BmHandlerClassDTO bmHandlerClassDTO = bmHandlerClassService.selectById(id);
        return BmHandlerClassStructMapper.INSTANCE.dto2Vo(bmHandlerClassDTO);
    }

    /**
     * 新增待分班信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmHandlerClassRequest request) {
        bmHandlerClassService.add(BmHandlerClassStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmHandlerClassService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmHandlerClassEdit edit) {
        bmHandlerClassService.update(BmHandlerClassStructMapper.INSTANCE.edit2Dto(edit));
    }

    /**
     * 一键分班！！！
     */
    @Transactional(rollbackFor = Exception.class)
    public void placementClass(BmHandlerClassRequest request) {
        // 待分班数据id集合
        List<Long> handlerIdList = request.getHandlerIdList();
        // 1.获取待分班数据
        List<BmHandlerClassDTO> bmHandlerClassDTOList = bmHandlerClassService.getToHandlerClass(handlerIdList);
        // 基础校验 TODO  校验此批数据是否为同一种类型 长期 或者 体验
        if (bmHandlerClassDTOList.size() != handlerIdList.size()) {
            log.error("待分班数据有误,检查入参重新请求");
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "待分班数据有误,检查入参重新请求");
        }

        // 2.获取当前校区教师数量
        BmTeacherDTO bmTeacherDTO = bmTeacherService.getCurrentTeacher();

        if (Objects.isNull(bmTeacherDTO)) {
            log.error("当前用户信息有误,请重新登录");
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前用户信息有误,请重新登录");
        }

        // 机构 id
        Long orgId = bmTeacherDTO.getTeaOrgId();

        // 获取此机构下所有教师数量
        LambdaQueryWrapper<BmTeacher> wrapper1 = Wrappers.lambdaQuery(BmTeacher.class);
        wrapper1.eq(BmTeacher::getTeaOrgId, orgId)
                .eq(BmTeacher::getDelFlag, Delete.NO);
        List<BmTeacher> bmTeacherList = bmTeacherService.list(wrapper1);
        List<Long> teacherIdList = bmTeacherList.stream().map(BmTeacher::getId).collect(Collectors.toList());
        // 校验教师数量
        if (bmTeacherList.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前机构下没有教师,无法进行分班");
        }

        // 3.获取当前校区教室数量 暂且仅有用户有租户概念，其他均无，后续可能会进行优化
        LambdaQueryWrapper<BmClassroom> wrapper2 = Wrappers.lambdaQuery(BmClassroom.class);
        wrapper2.eq(BmClassroom::getDelFlag, Delete.NO);
        List<BmClassroom> bmClassroomList = bmClassroomService.list(wrapper2);
        List<Long> bmClassroomIdList = bmClassroomList.stream().map(BmClassroom::getId).collect(Collectors.toList());
        if (bmClassroomList.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前校区没有教室,无法进行分班");
        }

        // 根据当前待分班数据，取出意向时间，教师与教室是否同时满足
        List<IntentionCurTime> intentionCurTimeList = bmHandlerClassDTOList
                .stream()
                .map(BmHandlerClassDTO::getIntentionCurTime)
                .collect(Collectors.toList());

        // 查询教师与教室此时是否有空闲时间
        LambdaQueryWrapper<BmClassroomIntention> wrapper3 = Wrappers.lambdaQuery(BmClassroomIntention.class);
        wrapper3.in(BmClassroomIntention::getClassroomId, bmClassroomIdList)
                .eq(BmClassroomIntention::getDelFlag, Delete.NO);
        List<BmClassroomIntention> bmClassroomIntentionList = bmClassroomIntentionService.list(wrapper3);
        List<BmClassroomIntention> bmClassroomIntentionList1 = bmClassroomIntentionList
                .stream()
                .filter(bmClassroomIntention -> intentionCurTimeList.contains(bmClassroomIntention.getIntentionCurTime()))
                .filter(bmClassroomIntention -> Objects.isNull(bmClassroomIntention.getClassGradeId()) ||
                        StringUtils.isBlank(bmClassroomIntention.getClassGradeName()))
                .collect(Collectors.toList());
        if (bmClassroomIntentionList1.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前校区没有空闲教室,无法进行分班");
        }

        LambdaQueryWrapper<BmTeacherIntention> wrapper4 = Wrappers.lambdaQuery(BmTeacherIntention.class);
        wrapper4.in(BmTeacherIntention::getTeacherId, teacherIdList)
                .eq(BmTeacherIntention::getDelFlag, Delete.NO);
        List<BmTeacherIntention> bmTeacherIntentionList = bmTeacherIntentionService.list(wrapper4);
        List<BmTeacherIntention> bmTeacherIntentionList1 = bmTeacherIntentionList
                .stream()
                .filter(bmTeacherIntention -> intentionCurTimeList.contains(bmTeacherIntention.getIntentionCurTime()))
                .filter(bmTeacherIntention -> Objects.isNull(bmTeacherIntention.getClassGradeId()) ||
                        StringUtils.isBlank(bmTeacherIntention.getClassGradeName()))
                .collect(Collectors.toList());
        if (bmTeacherIntentionList1.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前校区没有空闲老师,无法进行分班");
        }

        // 4.处理分班数据
        Map<IntentionCurTime, List<BmHandlerClassDTO>> intentionCurTimeListMap = bmHandlerClassDTOList
                .stream().collect(Collectors.groupingBy(BmHandlerClassDTO::getIntentionCurTime));

        // 5.根据分班数据意向时间，针对对应的教师与教室进行划分班级
        // 无对应教室的待分班数据
        Map<IntentionCurTime, List<BmHandlerClassDTO>> noClassroomMap = new HashMap<>();
        Map<IntentionCurTime, List<BmHandlerClassDTO>> maxTeacherMap = new HashMap<>();

        for (Map.Entry<IntentionCurTime, List<BmHandlerClassDTO>> entry : intentionCurTimeListMap.entrySet()) {
            // 意向时间
            IntentionCurTime intentionCurTime = entry.getKey();

            // 根据意向时间获取教室数据
            BmClassroomIntention bmClassroomIntention1 = bmClassroomIntentionList1.stream()
                    .filter(bmClassroomIntention -> bmClassroomIntention.getIntentionCurTime().equals(intentionCurTime))
                    .findFirst()
                    .orElse(null);

            // 当前意向时间没有空闲教室，记录数据
            if (Objects.isNull(bmClassroomIntention1)) {
                noClassroomMap.put(intentionCurTime, entry.getValue());
                log.warn("当前意向时间没有对应的教室，记录数据-意向时间：【{}】 - 人数：【{}】", intentionCurTime, entry.getValue().size());
                continue;
            }
            // 判断当前意向上课时间是否超过 当前学校最大老师数量
            LambdaQueryWrapper<BmClassroomIntention> wrapper5 = Wrappers.lambdaQuery(BmClassroomIntention.class);
            wrapper5.in(BmClassroomIntention::getIntentionCurTime, intentionCurTime)
                    .eq(BmClassroomIntention::getClassGradeId, null)
                    .eq(BmClassroomIntention::getClassGradeName, null)
                    .eq(BmClassroomIntention::getDelFlag, Delete.NO);
            List<BmClassroomIntention> bmClassroomIntentionList2 = bmClassroomIntentionService.list(wrapper3);

            // 获取教室详细信息
            BmClassroomDTO bmClassroomDTO = bmClassroomService.selectById(bmClassroomIntention1.getClassroomId());

            if (bmClassroomIntentionList2.size() + 1 > bmTeacherList.size()) {
                maxTeacherMap.put(intentionCurTime, entry.getValue());
                log.warn("当前意向时间已经超过校区内最大老师数量，记录数据-意向时间：【{}】 - 人数：【{}】", intentionCurTime, entry.getValue().size());
                continue;
            }

            // 处理人数最大值是否满足教室最大值


        }


        // 6.更新待分班状态
        // 7.创建待确认班级数据
        // 8.回执无法进行分班数据
    }

    /**
     * 校验此批意向时间下是否有空闲教师与老师
     */
    private void checkClassroomAndTeacher(List<IntentionCurTime> intentionCurTimeList, List<Long> bmClassroomIdList, List<Long> teacherIdList) {

    }
}
