package com.mini.biz.manager.org;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.BmClassroomIntentionService;
import com.mini.manager.service.BmClassroomService;
import com.mini.pojo.entity.org.BmClassroom;
import com.mini.pojo.entity.org.BmClassroomIntention;
import com.mini.pojo.mapper.org.BmClassroomStructMapper;
import com.mini.pojo.model.dto.org.BmClassroomDTO;
import com.mini.pojo.model.edit.org.BmClassroomEdit;
import com.mini.pojo.model.query.org.BmClassroomQuery;
import com.mini.pojo.model.request.org.BmClassroomRequest;
import com.mini.pojo.model.vo.org.BmClassroomDetailVo;
import com.mini.pojo.model.vo.org.BmClassroomVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author zhl
 * @create 2024/11/12 17:18
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmClassroomBiz {

    private final BmClassroomService bmClassroomService;

    private final BmClassroomIntentionService bmClassroomIntentionService;

    /**
     * 分页
     */
    public IPage<BmClassroomVo> page(BmClassroomQuery query) {
        IPage<BmClassroomDTO> page = bmClassroomService.page(query);
        return page.convert(BmClassroomStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条教室详情
     */
    public BmClassroomDetailVo getEntityById(Long id) {
        return bmClassroomService.selectClassroomIntentionById(id);
    }

    /**
     * 新增教室信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmClassroomRequest request) {
        BmClassroomDTO bmClassroomDTO = bmClassroomService.add(BmClassroomStructMapper.INSTANCE.req2Dto(request));
        // 新增教室默认数据
        handlerClassroomIntention(bmClassroomDTO);

    }

    /**
     * 处理教室与意向时间数据默认数据
     */
    private void handlerClassroomIntention(BmClassroomDTO bmClassroomDTO) {

        List<BmClassroomIntention> toSaveIntentionList = new ArrayList<>();

        List<IntentionCurTime> intentionCurTimeList = Arrays.asList(IntentionCurTime.values());

        intentionCurTimeList.forEach(intentionCurTime -> {
            BmClassroomIntention bmClassroomIntention = getBmClassroomIntention(bmClassroomDTO, intentionCurTime);
            toSaveIntentionList.add(bmClassroomIntention);
        });
        bmClassroomIntentionService.saveBatch(toSaveIntentionList);
    }

    /**
     * 封装教室关联数据
     */
    private BmClassroomIntention getBmClassroomIntention(BmClassroomDTO bmClassroomDTO, IntentionCurTime intentionCurTime) {
        BmClassroomIntention bmClassroomIntention = new BmClassroomIntention();
        bmClassroomIntention.setId(IDGenerator.next());
        bmClassroomIntention.setClassroomId(bmClassroomDTO.getId());
        bmClassroomIntention.setClassroomName(bmClassroomDTO.getRoomName());
        bmClassroomIntention.setRoomSize(bmClassroomDTO.getRoomSize());
        bmClassroomIntention.setIntentionCurTime(intentionCurTime);
        bmClassroomIntention.setDelFlag(Delete.NO);
        return bmClassroomIntention;
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        // 判断当前教室意向时间有无班级数据
        LambdaQueryWrapper<BmClassroomIntention> wrapper = Wrappers.lambdaQuery(BmClassroomIntention.class);
        wrapper.eq(BmClassroomIntention::getClassroomId, id)
                .isNotNull(BmClassroomIntention::getClassGradeId)
                .isNotNull(BmClassroomIntention::getClassGradeName)
                .eq(BmClassroomIntention::getDelFlag, Delete.NO);
        long count = bmClassroomIntentionService.count(wrapper);
        if (count > 0) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "教室意向时间有班级关联，不允许删除");
        }
        // 删除
        bmClassroomService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmClassroomEdit edit) {
        bmClassroomService.update(BmClassroomStructMapper.INSTANCE.edit2Dto(edit));
    }

    /**
     * 同步教室与意向时间数据
     */
    @Transactional(rollbackFor = Exception.class)
    public void syncClassroom() {
        handlerClassroomIntention(Arrays.asList(IntentionCurTime.values()));
    }

    /**
     * 处理教室与意向时间数据默认数据
     */
    private void handlerClassroomIntention(List<IntentionCurTime> intentionCurTimeList) {
        // 所有教室
        LambdaQueryWrapper<BmClassroom> wrapper = Wrappers.lambdaQuery(BmClassroom.class);
        wrapper.eq(BmClassroom::getDelFlag, Delete.NO);
        List<BmClassroom> bmClassroomList = bmClassroomService.list(wrapper);

        // 教室关联关系
        LambdaQueryWrapper<BmClassroomIntention> wrapper1 = Wrappers.lambdaQuery(BmClassroomIntention.class);
        wrapper1.eq(BmClassroomIntention::getDelFlag, Delete.NO);
        List<BmClassroomIntention> bmClassroomIntentionList = bmClassroomIntentionService.list(wrapper1);
        // 根据教室id进行分组数据
        Map<Long, List<BmClassroomIntention>> bmClassroomIntentionMap = bmClassroomIntentionList
                .stream()
                .collect(Collectors
                        .groupingBy(BmClassroomIntention::getClassroomId));

        List<BmClassroomIntention> toSaveIntentionList = new ArrayList<>();

        // 判断哪些意向时间教室没有关联
        bmClassroomList.forEach(bmClassroom -> {
            List<BmClassroomIntention> classroomIntentionList = bmClassroomIntentionMap.get(bmClassroom.getId());
            // 教室没有关联任何意向时间，则添加默认数据
            if (CollectionUtils.isEmpty(classroomIntentionList)) {
                intentionCurTimeList.forEach(intentionCurTime -> {
                    BmClassroomIntention bmClassroomIntention = getBmClassroomIntention(bmClassroom, intentionCurTime);
                    toSaveIntentionList.add(bmClassroomIntention);
                });
                return;
            }

            // 有部分数据，进行取差集，进行批量新增
            List<IntentionCurTime> intentionCurTimeList1 = classroomIntentionList
                    .stream()
                    .map(BmClassroomIntention::getIntentionCurTime)
                    .collect(Collectors.toList());
            List<IntentionCurTime> diffList = new ArrayList<>(CollectionUtils.subtract(intentionCurTimeList, intentionCurTimeList1));

            if (CollectionUtils.isNotEmpty(diffList)) {
                diffList.forEach(intentionCurTime -> {
                    BmClassroomIntention bmClassroomIntention = getBmClassroomIntention(bmClassroom, intentionCurTime);
                    toSaveIntentionList.add(bmClassroomIntention);
                });
            }
        });

        bmClassroomIntentionService.saveBatch(toSaveIntentionList);
    }

    /**
     * 封装教室关联数据
     */
    private BmClassroomIntention getBmClassroomIntention(BmClassroom bmClassroom, IntentionCurTime intentionCurTime) {
        BmClassroomIntention bmClassroomIntention = new BmClassroomIntention();
        bmClassroomIntention.setId(IDGenerator.next());
        bmClassroomIntention.setClassroomId(bmClassroom.getId());
        bmClassroomIntention.setClassroomName(bmClassroom.getRoomName());
        bmClassroomIntention.setRoomSize(bmClassroom.getRoomSize());
        bmClassroomIntention.setIntentionCurTime(intentionCurTime);
        bmClassroomIntention.setDelFlag(Delete.NO);
        return bmClassroomIntention;
    }
}
