package com.mini.biz.app.business;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.RedisConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.ApplyStatus;
import com.mini.common.enums.str.CourseType;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.DecimalUtil;
import com.mini.common.utils.LoginUtils;
import com.mini.common.utils.redis.RedisUtils;
import com.mini.manager.service.*;
import com.mini.pojo.entity.edu.BmTutorTeacher;
import com.mini.pojo.mapper.edu.BmTutorApplyStructMapper;
import com.mini.pojo.mapper.edu.BmTutorTeacherStructMapper;
import com.mini.pojo.mapper.operate.BmIdeaStructMapper;
import com.mini.pojo.model.dto.edu.BmTutorApplyDTO;
import com.mini.pojo.model.dto.edu.BmTutorTeacherDTO;
import com.mini.pojo.model.dto.operate.BmIdeaDTO;
import com.mini.pojo.model.query.business.BmTutorQuery;
import com.mini.pojo.model.request.edu.BmTutorApplyRequest;
import com.mini.pojo.model.request.operate.BmIdeaRequest;
import com.mini.pojo.model.vo.business.BmHandlerClassHourVo;
import com.mini.pojo.model.vo.business.BmPatriarchStuBaseInfo;
import com.mini.pojo.model.vo.edu.BmTutorTeacherVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author zhl
 * @create 2025/3/18 16:09
 */
@Component
@RequiredArgsConstructor
public class AppHomeSchoolBiz {

    private final BmPatriarchService bmPatriarchService;

    private final BmTutorTeacherService bmTutorTeacherService;

    private final BmStuClassHourService bmStuClassHourService;

    private final BmTutorApplyService bmTutorApplyService;

    private final BmIdeaService bmIdeaService;

    /**
     * 获取我的孩子以及我的孩子对应的课程信息
     */
    public List<BmPatriarchStuBaseInfo> getMyStuInfo() {
        Long patriarchId = LoginUtils.getLoginUser().getPatriarchId();
        return bmPatriarchService.patStuInfo(patriarchId);
    }

    /**
     * 根据申请时间与课程类型选择教师 // TODO 此处默认展示全部教师
     */
    public List<BmTutorTeacherVo> getTutorTeacherList(String giveClassType, String applyTime) {
        LambdaQueryWrapper<BmTutorTeacher> wrapper = Wrappers.lambdaQuery(BmTutorTeacher.class);
        wrapper.eq(BmTutorTeacher::getDelFlag, Delete.NO);
        return BmTutorTeacherStructMapper.INSTANCE.entityList2VoList(bmTutorTeacherService.list(wrapper));
    }

    /**
     * 根据选择教师，计算消耗课时
     */
    public BmHandlerClassHourVo getHandlerClassHour(BmTutorQuery query) {
        BmHandlerClassHourVo vo = new BmHandlerClassHourVo();

        // 查询当前学生是否有当前课程课时
        Map<CourseType, Long> allTypeClassHour = bmStuClassHourService.getAllTypeClassHour(query.getStuId());
        if (Objects.isNull(allTypeClassHour)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生课程类型与课时信息不存在");
        }

        if (Objects.isNull(allTypeClassHour.get(query.getCourseType()))) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "您的还在暂时没有此课程的课时信息");
        }

        Long classHour = allTypeClassHour.get(query.getCourseType());

        if (10000 > classHour) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "您的当前课程类型课时不足1课时");
        }

        // 查询教师是否存在
        BmTutorTeacherDTO bmTutorTeacherDTO = bmTutorTeacherService.selectById(query.getTutorId());
        if (Objects.isNull(bmTutorTeacherDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前教师信息不存在");
        }

        // 计算课时消耗比例，剩余课时不足提醒家长

        Double rate = RedisUtils.getCacheObject(RedisConstant.COURSE_TYPE_RATIO + ":" + query.getCourseType().getStringValue());
        double resClassHour = DecimalUtil.mul(query.getClassHour().doubleValue(), rate);
        if (resClassHour > classHour) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "您当前剩余课时不足");
        }

        vo.setExpend(resClassHour);
        vo.setResidue(classHour - resClassHour);
        return vo;
    }

    /**
     * 提交预约信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void submitTutorApply(BmTutorApplyRequest request) {
        // 查询当前学生是否有当前课程课时
        BmTutorApplyDTO bmTutorApplyDTO = BmTutorApplyStructMapper.INSTANCE.req2Dto(request);
        bmTutorApplyDTO.setApplyStatus(ApplyStatus.APPLY_ING);
        bmTutorApplyService.add(bmTutorApplyDTO);
    }

    /**
     * 我的预约列表
     */

    /**
     * 意见箱提交
     */
    @Transactional(rollbackFor = Exception.class)
    public void submitIdea(BmIdeaRequest request) {
        BmIdeaDTO bmIdeaDTO = BmIdeaStructMapper.INSTANCE.req2Dto(request);
        bmIdeaService.add(bmIdeaDTO);
    }

}
