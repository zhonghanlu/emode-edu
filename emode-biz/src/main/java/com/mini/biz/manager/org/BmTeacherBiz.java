package com.mini.biz.manager.org;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.auth.model.dto.AuthUserDTO;
import com.mini.auth.service.IAuthUserService;
import com.mini.base.service.ISysConfigService;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.enums.str.UserType;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.SmCryptoUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.file.service.ISysFileService;
import com.mini.manager.service.BmTeacherIntentionService;
import com.mini.manager.service.BmTeacherService;
import com.mini.manager.service.BmUserTeacherService;
import com.mini.pojo.entity.org.BmTeacher;
import com.mini.pojo.entity.org.BmTeacherIntention;
import com.mini.pojo.entity.org.BmUserTeacher;
import com.mini.pojo.mapper.org.BmTeacherStructMapper;
import com.mini.pojo.model.dto.org.BmTeacherDTO;
import com.mini.pojo.model.edit.org.BmTeacherEdit;
import com.mini.pojo.model.query.org.BmTeacherQuery;
import com.mini.pojo.model.request.org.BmTeacherRequest;
import com.mini.pojo.model.vo.org.BmTeacherDetailVo;
import com.mini.pojo.model.vo.org.BmTeacherVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

import static com.mini.common.constant.RedisConstant.SYS_CONFIG_INIT_PASSWORD;

/**
 * @author zhl
 * @create 2024/11/12 17:18
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmTeacherBiz {

    private final BmTeacherService bmTeacherService;

    private final BmUserTeacherService bmUserTeacherService;

    private final IAuthUserService authUserService;

    private final ISysConfigService sysConfigService;

    private final BmTeacherIntentionService bmTeacherIntentionService;

    /**
     * 分页
     */
    public IPage<BmTeacherVo> page(BmTeacherQuery query) {
        IPage<BmTeacherDTO> page = bmTeacherService.page(query);
        return page.convert(BmTeacherStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条教师详情
     */
    public BmTeacherDetailVo getEntityById(Long id) {
        return bmTeacherService.selectTeaIntentionDetailById(id);
    }

    /**
     * 新增教师信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmTeacherRequest request) {
        // 1.新增教师
        BmTeacherDTO bmTeacherDTO = bmTeacherService.add(BmTeacherStructMapper.INSTANCE.req2Dto(request));

        // 2.新增账户信息
        AuthUserDTO authUserDTO = new AuthUserDTO();
        authUserDTO.setId(IDGenerator.next());
        authUserDTO.setUsername(bmTeacherDTO.getTeaPhone());
        authUserDTO.setPassword(SmCryptoUtil.doHashValue(sysConfigService.searchByKey(SYS_CONFIG_INIT_PASSWORD)));
        authUserDTO.setNickname(bmTeacherDTO.getTeaName());
        authUserDTO.setSex(bmTeacherDTO.getSex());
        authUserDTO.setAvatarId(bmTeacherDTO.getTeaAvatarId());
        authUserDTO.setAvatarUrl(bmTeacherDTO.getTeaAvatarUrl());
        authUserDTO.setPhone(bmTeacherDTO.getTeaPhone());
        authUserDTO.setUserType(UserType.MANAGER);
        authUserService.insert(authUserDTO);

        // 3.新增教师与账户关联关系
        BmUserTeacher bmUserTeacher = new BmUserTeacher();
        bmUserTeacher.setId(IDGenerator.next());
        bmUserTeacher.setTeaId(bmTeacherDTO.getId());
        bmUserTeacher.setUserId(authUserDTO.getId());

        boolean b = bmUserTeacherService.save(bmUserTeacher);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增教师与账户关联关系失败");
        }

        // 4.新增教师意向时间
        handlerTeacherIntention(bmTeacherDTO);
    }

    /**
     * 处理教室与意向时间数据默认数据
     */
    private void handlerTeacherIntention(BmTeacherDTO bmTeacherDTO) {
        List<BmTeacherIntention> toSaveIntentionList = new ArrayList<>();
        List<IntentionCurTime> intentionCurTimeList = Arrays.asList(IntentionCurTime.values());

        intentionCurTimeList.forEach(intentionCurTime -> {
            BmTeacherIntention bmTeacherIntention = getBmTeacherIntention(bmTeacherDTO, intentionCurTime);
            toSaveIntentionList.add(bmTeacherIntention);
        });

        bmTeacherIntentionService.saveBatch(toSaveIntentionList);
    }

    /**
     * 封装教师关联数据
     */
    private BmTeacherIntention getBmTeacherIntention(BmTeacherDTO bmTeacherDTO, IntentionCurTime intentionCurTime) {
        BmTeacherIntention bmTeacherIntention = new BmTeacherIntention();
        bmTeacherIntention.setId(IDGenerator.next());
        bmTeacherIntention.setTeacherId(bmTeacherDTO.getId());
        bmTeacherIntention.setTeacherName(bmTeacherDTO.getTeaName());
        bmTeacherIntention.setIntentionCurTime(intentionCurTime);
        bmTeacherIntention.setDelFlag(Delete.NO);
        return bmTeacherIntention;
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmTeacherService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmTeacherEdit edit) {
        bmTeacherService.update(BmTeacherStructMapper.INSTANCE.edit2Dto(edit));
    }

    /**
     * 同步教师意向时间信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void syncTeacher() {
        handlerTeacherIntention(Arrays.asList(IntentionCurTime.values()));
    }

    /**
     * 处理教室与意向时间数据默认数据
     */
    private void handlerTeacherIntention(List<IntentionCurTime> intentionCurTimeList) {
        // 所有教师
        LambdaQueryWrapper<BmTeacher> wrapper = Wrappers.lambdaQuery(BmTeacher.class);
        wrapper.eq(BmTeacher::getDelFlag, Delete.NO);
        List<BmTeacher> bmTeacherList = bmTeacherService.list(wrapper);

        // 教师关联关系
        LambdaQueryWrapper<BmTeacherIntention> wrapper1 = Wrappers.lambdaQuery(BmTeacherIntention.class);
        wrapper1.eq(BmTeacherIntention::getDelFlag, Delete.NO);
        List<BmTeacherIntention> bmTeacherIntentionList = bmTeacherIntentionService.list(wrapper1);
        // 根据教室id进行分组数据
        Map<Long, List<BmTeacherIntention>> bmTeacherIntentionMap = bmTeacherIntentionList
                .stream()
                .collect(Collectors
                        .groupingBy(BmTeacherIntention::getTeacherId));

        List<BmTeacherIntention> toSaveIntentionList = new ArrayList<>();

        // 判断哪些意向时间教室没有关联
        bmTeacherList.forEach(bmTeacher -> {
            List<BmTeacherIntention> teacherIntentionList = bmTeacherIntentionMap.get(bmTeacher.getId());
            // 教室没有关联任何意向时间，则添加默认数据
            if (CollectionUtils.isEmpty(teacherIntentionList)) {
                intentionCurTimeList.forEach(intentionCurTime -> {
                    BmTeacherIntention bmTeacherIntention = getBmTeacherIntention(bmTeacher, intentionCurTime);
                    toSaveIntentionList.add(bmTeacherIntention);
                });
                return;
            }

            // 有部分数据，进行取差集，进行批量新增
            List<IntentionCurTime> intentionCurTimeList1 = teacherIntentionList
                    .stream()
                    .map(BmTeacherIntention::getIntentionCurTime)
                    .collect(Collectors.toList());
            List<IntentionCurTime> diffList = new ArrayList<>(CollectionUtils.subtract(intentionCurTimeList, intentionCurTimeList1));

            if (CollectionUtils.isNotEmpty(diffList)) {
                diffList.forEach(intentionCurTime -> {
                    BmTeacherIntention bmTeacherIntention = getBmTeacherIntention(bmTeacher, intentionCurTime);
                    toSaveIntentionList.add(bmTeacherIntention);
                });
            }
        });

        bmTeacherIntentionService.saveBatch(toSaveIntentionList);
    }

    /**
     * 封装教师关联数据
     */
    private BmTeacherIntention getBmTeacherIntention(BmTeacher bmTeacher, IntentionCurTime intentionCurTime) {
        BmTeacherIntention bmTeacherIntention = new BmTeacherIntention();
        bmTeacherIntention.setId(IDGenerator.next());
        bmTeacherIntention.setTeacherId(bmTeacher.getId());
        bmTeacherIntention.setTeacherName(bmTeacher.getTeaName());
        bmTeacherIntention.setIntentionCurTime(intentionCurTime);
        bmTeacherIntention.setDelFlag(Delete.NO);
        return bmTeacherIntention;
    }
}
