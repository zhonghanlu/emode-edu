package com.mini.biz.manager.course;

import com.google.common.collect.Lists;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.HandlerClassConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.HandlerClassStatus;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.redis.RedisUtils;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.*;
import com.mini.pojo.entity.course.BmClassGrade;
import com.mini.pojo.entity.course.BmHandlerClass;
import com.mini.pojo.entity.course.BmStuClassGrade;
import com.mini.pojo.entity.org.BmClassroomIntention;
import com.mini.pojo.entity.org.BmTeacherIntention;
import com.mini.pojo.mapper.course.BmClassGradeStructMapper;
import com.mini.pojo.mapper.course.BmHandlerClassStructMapper;
import com.mini.pojo.model.dto.course.BmClassGradeDTO;
import com.mini.pojo.model.dto.course.BmHandlerClassDTO;
import com.mini.pojo.model.dto.course.BmHandlerClassPlacementDTO;
import com.mini.pojo.model.dto.org.BmClassroomDTO;
import com.mini.pojo.model.dto.org.BmTeacherDTO;
import com.mini.pojo.model.edit.course.BmHandlerClassEdit;
import com.mini.pojo.model.query.course.BmHandlerClassQuery;
import com.mini.pojo.model.request.course.BmHandlerClassRequest;
import com.mini.pojo.model.vo.course.BmFailHandlerClassVo;
import com.mini.pojo.model.vo.course.BmHandlerClassResultVo;
import com.mini.pojo.model.vo.course.BmHandlerClassVo;
import com.mini.pojo.model.vo.course.BmPreHandlerClassVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
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

    private final BmClassGradeService bmClassGradeService;

    private final BmStuClassGradeService bmStuClassGradeService;

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
    public BmHandlerClassResultVo placementClass(BmHandlerClassRequest request) {
        // 声明未能正常分班数据map   声明可以正常处理数据最终List
        Map<String, List<BmHandlerClassDTO>> unableHandlerClass = new HashMap<>();
        List<BmHandlerClassPlacementDTO> bmHandlerClassPlacementDTOList = new ArrayList<>();

        List<Long> handlerIdList = request.getHandlerIdList();

        // 1.获取待分班数据
        List<BmHandlerClassDTO> bmHandlerClassDTOList = bmHandlerClassService.getToHandlerClass(request.getCurType(), request.getProductType(), handlerIdList);

        // 2.基础参数校验
        List<BmClassroomIntention> bmClassroomIntentionList = verifyBaseParam(bmHandlerClassDTOList, handlerIdList);

        // 3.处理分班数据
        Map<IntentionCurTime, List<BmHandlerClassDTO>> intentionCurTimeListMap = bmHandlerClassDTOList.stream().collect(Collectors.groupingBy(BmHandlerClassDTO::getIntentionCurTime));

        // 4.根据分班数据意向时间，针对对应的教师与教室进行划分班级
        processHandlerClassDTOList(intentionCurTimeListMap, bmClassroomIntentionList, unableHandlerClass, bmHandlerClassPlacementDTOList);

        // 5.封装数据，返回
        List<BmFailHandlerClassVo> bmFailHandlerClassVoList = getFailBmHandlerClassVoList(unableHandlerClass);
        List<BmPreHandlerClassVo> bmPreHandlerClassVoList = processPreClassVo(request, bmHandlerClassPlacementDTOList);

        return BmHandlerClassResultVo.builder()
                .bmFailHandlerClassVoList(bmFailHandlerClassVoList)
                .bmPreHandlerClassVoList(bmPreHandlerClassVoList).build();
    }

    /**
     * 封装返回成功分班数据
     */
    private List<BmPreHandlerClassVo> processPreClassVo(BmHandlerClassRequest request, List<BmHandlerClassPlacementDTO> bmHandlerClassPlacementDTOList) {
        List<BmPreHandlerClassVo> bmPreHandlerClassVoList = new ArrayList<>();

        bmHandlerClassPlacementDTOList.forEach(bmHandlerClassPlacementDTO -> {
            List<BmClassroomIntention> classroomIntentionList = bmHandlerClassPlacementDTO.getClassroomIntentionList();
            List<BmTeacherIntention> bmTeacherIntentionList = bmHandlerClassPlacementDTO.getBmTeacherIntentionList();
            List<BmHandlerClassDTO> bmHandlerClassDTOList1 = bmHandlerClassPlacementDTO.getBmHandlerClassDTOList();

            for (int b = 0; b < classroomIntentionList.size(); b++) {
                if (CollectionUtils.isEmpty(bmHandlerClassDTOList1)) {
                    return;
                }
                // 获取此班级的教师与教室
                BmTeacherIntention bmTeacherIntention = bmTeacherIntentionList.get(b);
                BmClassroomIntention bmClassroomIntention = classroomIntentionList.get(b);

                BmPreHandlerClassVo bmPreHandlerClassVo = new BmPreHandlerClassVo();

                long classSize = RedisUtils.incrAtomicValue(request.getCurType().getStringValue());
                bmPreHandlerClassVo.setClassGradeName(request.getCurType().getStringValue() + classSize + "班");
                bmPreHandlerClassVo.setIntentionCurTime(bmHandlerClassPlacementDTO.getIntentionCurTime());
                bmPreHandlerClassVo.setTeacherId(bmTeacherIntention.getTeacherId());
                bmPreHandlerClassVo.setTeacherName(bmTeacherIntention.getTeacherName());
                bmPreHandlerClassVo.setClassroomId(bmClassroomIntention.getClassroomId());
                bmPreHandlerClassVo.setClassroomName(bmClassroomIntention.getClassroomName());

                Integer roomSize = bmClassroomIntention.getRoomSize();
                if (roomSize > bmHandlerClassDTOList1.size()) {
                    roomSize = bmHandlerClassDTOList1.size();
                }
                List<BmPreHandlerClassVo.BmStuInfo> bmStuInfoList = bmHandlerClassDTOList1.subList(0, roomSize)
                        .stream().map(dto -> new BmPreHandlerClassVo.BmStuInfo(dto.getStuId(), dto.getStuName()))
                        .collect(Collectors.toList());
                bmPreHandlerClassVo.setStuInfoList(bmStuInfoList);
                bmPreHandlerClassVoList.add(bmPreHandlerClassVo);

                // 減去此批数据
                bmHandlerClassDTOList1 = bmHandlerClassDTOList1.subList(roomSize, bmHandlerClassDTOList1.size());
            }
        });

        return bmPreHandlerClassVoList;
    }

    /**
     * 保存班级数据、教师与教室意向时间数据、学生与班级数据、更新此批可分班学员数据
     */
    private void saveDb(BmHandlerClassRequest request, List<BmHandlerClassPlacementDTO> bmHandlerClassPlacementDTOList) {
        List<BmClassGrade> bmClassGradeDbList = new ArrayList<>();
        List<BmTeacherIntention> bmTeacherIntentionDbList = new ArrayList<>();
        List<BmClassroomIntention> bmClassroomIntentionDbList = new ArrayList<>();
        List<BmStuClassGrade> bmStuClassGradeDbList = new ArrayList<>();

        // 更新待分班数据为待确认
        List<BmHandlerClassDTO> toUpdate = bmHandlerClassPlacementDTOList
                .stream()
                .flatMap(bmHandlerClassPlacementDTO -> bmHandlerClassPlacementDTO.getBmHandlerClassDTOList()
                        .stream())
                .collect(Collectors.toList());
        toUpdate.forEach(item -> item.setHandlerClassStatus(HandlerClassStatus.TO_CONFIRMED));
        List<BmHandlerClass> bmHandlerClassList = BmHandlerClassStructMapper.INSTANCE.dtoList2EntityList(toUpdate);

        bmHandlerClassPlacementDTOList.forEach(bmHandlerClassPlacementDTO -> {

            List<BmClassroomIntention> classroomIntentionList = bmHandlerClassPlacementDTO.getClassroomIntentionList();
            List<BmTeacherIntention> bmTeacherIntentionList = bmHandlerClassPlacementDTO.getBmTeacherIntentionList();
            List<BmHandlerClassDTO> bmHandlerClassDTOList1 = bmHandlerClassPlacementDTO.getBmHandlerClassDTOList();

            for (int b = 0; b < classroomIntentionList.size(); b++) {
                BmTeacherIntention bmTeacherIntention = bmTeacherIntentionList.get(b);
                BmClassroomIntention bmClassroomIntention = classroomIntentionList.get(b);

                // 创建班级
                BmClassGradeDTO bmClassGradeDTO = getBmClassGradeDTO(request, bmTeacherIntention, bmClassroomIntention, bmClassGradeDbList);

                // 更新教师 教室意向列表数据
                getTeaAndRoomIntention(bmTeacherIntention, bmClassGradeDTO, bmTeacherIntentionDbList, bmClassroomIntention, bmClassroomIntentionDbList);

                // 创建学生与班级关系
                int toHandlerSize = bmHandlerClassDTOList1.size();
                int roomSize = bmClassroomIntention.getRoomSize();
                if (roomSize > 0 && toHandlerSize > 0) {
                    for (BmHandlerClassDTO bmHandlerClassDTO : bmHandlerClassDTOList1) {
                        // 创建学生与班级数据
                        getStuClassGrade(bmHandlerClassDTO, bmClassGradeDTO, bmStuClassGradeDbList);

                        // 减少教室容量
                        roomSize--;
                        toHandlerSize--;
                    }
                }
                bmHandlerClassDTOList1 = bmHandlerClassDTOList1.subList(0, toHandlerSize);
            }
        });

        saveDb(bmHandlerClassList, bmClassGradeDbList, bmTeacherIntentionDbList, bmClassroomIntentionDbList, bmStuClassGradeDbList);
    }

    /**
     * 实际进行新增与修改操作
     */
    private void saveDb(List<BmHandlerClass> bmHandlerClassList, List<BmClassGrade> bmClassGradeDbList, List<BmTeacherIntention> bmTeacherIntentionDbList, List<BmClassroomIntention> bmClassroomIntentionDbList, List<BmStuClassGrade> bmStuClassGradeDbList) {
        // 更新此批学生的分班状态
        boolean b = bmHandlerClassService.updateBatchById(bmHandlerClassList);
        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "待确认分班数据更新失败");
        }

        // 新增班级数据
        boolean b1 = bmClassGradeService.saveBatch(bmClassGradeDbList);
        if (!b1) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "班级数据新增失败");
        }

        // 修改教师意向时间数据
        boolean b2 = bmTeacherIntentionService.updateBatchById(bmTeacherIntentionDbList);
        if (!b2) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "教师意向时间数据修改失败");
        }

        // 修改教室意向时间数据
        boolean b3 = bmClassroomIntentionService.updateBatchById(bmClassroomIntentionDbList);
        if (!b3) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "教室意向时间数据修改失败");
        }

        // 新增学生与班级数据
        boolean b4 = bmStuClassGradeService.saveBatch(bmStuClassGradeDbList);
        if (!b4) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "学生与班级数据新增失败");
        }
    }

    /**
     * 封装学生与班级数据
     */
    private void getStuClassGrade(BmHandlerClassDTO bmHandlerClassDTO, BmClassGradeDTO bmClassGradeDTO, List<BmStuClassGrade> bmStuClassGradeDbList) {
        BmStuClassGrade bmStuClassGrade = new BmStuClassGrade();
        bmStuClassGrade.setId(IDGenerator.next());
        bmStuClassGrade.setStuId(bmHandlerClassDTO.getStuId());
        bmStuClassGrade.setStuName(bmHandlerClassDTO.getStuName());
        bmStuClassGrade.setCourseType(bmHandlerClassDTO.getCurType());
        bmStuClassGrade.setClassGradeId(bmClassGradeDTO.getId());
        bmStuClassGrade.setClassGradeName(bmClassGradeDTO.getClassGradeName());
        bmStuClassGrade.setDelFlag(Delete.NO);
        bmStuClassGradeDbList.add(bmStuClassGrade);
    }

    /**
     * 封装教师与教室意向数据
     */
    private void getTeaAndRoomIntention(BmTeacherIntention bmTeacherIntention, BmClassGradeDTO bmClassGradeDTO, List<BmTeacherIntention> bmTeacherIntentionDbList, BmClassroomIntention bmClassroomIntention, List<BmClassroomIntention> bmClassroomIntentionDbList) {
        bmTeacherIntention.setClassGradeId(bmClassGradeDTO.getId());
        bmTeacherIntention.setClassGradeName(bmClassGradeDTO.getClassGradeName());
        bmTeacherIntentionDbList.add(bmTeacherIntention);

        bmClassroomIntention.setClassGradeId(bmClassGradeDTO.getId());
        bmClassroomIntention.setClassGradeName(bmClassGradeDTO.getClassGradeName());
        bmClassroomIntentionDbList.add(bmClassroomIntention);
    }

    /**
     * 封装班级数据
     */
    private BmClassGradeDTO getBmClassGradeDTO(BmHandlerClassRequest request, BmTeacherIntention bmTeacherIntention, BmClassroomIntention bmClassroomIntention, List<BmClassGrade> bmClassGradeDbList) {
        BmClassGradeDTO bmClassGradeDTO = new BmClassGradeDTO();
        bmClassGradeDTO.setId(IDGenerator.next());
        long classSize = RedisUtils.incrAtomicValue(request.getCurType().getStringValue());
        bmClassGradeDTO.setClassGradeName(request.getCurType().getStringValue() + classSize + "班");
        bmClassGradeDTO.setTeaId(bmTeacherIntention.getTeacherId());
        bmClassGradeDTO.setTeaName(bmTeacherIntention.getTeacherName());
        bmClassGradeDTO.setClassroomId(bmClassroomIntention.getClassroomId());
        bmClassGradeDTO.setClassroomName(bmClassroomIntention.getClassroomName());
        bmClassGradeDTO.setCurType(request.getCurType());
        bmClassGradeDTO.setClassGardeType(request.getProductType());
        BmClassGrade bmClassGrade = BmClassGradeStructMapper.INSTANCE.dto2Entity(bmClassGradeDTO);
        bmClassGrade.setDelFlag(Delete.NO);
        bmClassGradeDbList.add(bmClassGrade);
        return bmClassGradeDTO;
    }

    /**
     * 封装返回数据
     */
    private List<BmFailHandlerClassVo> getFailBmHandlerClassVoList(Map<String, List<BmHandlerClassDTO>> unableHandlerClass) {
        List<BmFailHandlerClassVo> bmHandlerClassResultVoList = new ArrayList<>();
        if (Objects.nonNull(unableHandlerClass) && !unableHandlerClass.isEmpty()) {
            unableHandlerClass.forEach((key, value) -> value.forEach(item -> {
                BmFailHandlerClassVo bmHandlerClassResultVo = new BmFailHandlerClassVo();
                bmHandlerClassResultVo.setStuId(item.getStuId());
                bmHandlerClassResultVo.setStuName(item.getStuName());
                bmHandlerClassResultVo.setIntentionCurTime(item.getIntentionCurTime());
                bmHandlerClassResultVo.setCurType(item.getCurType());
                bmHandlerClassResultVo.setProductType(item.getProductType());
                if (HandlerClassConstant.NONE_INTENTION_CLASSROOM.equals(key)) {
                    bmHandlerClassResultVo.setErrorReason("当前意向时间没有空闲教室");
                } else if (HandlerClassConstant.EXCEED_INTENTION_CLASSROOM.equals(key)) {
                    bmHandlerClassResultVo.setErrorReason("超出教室最大承载量");
                } else if (HandlerClassConstant.EXCEED_INTENTION_TEACHER.equals(key)) {
                    bmHandlerClassResultVo.setErrorReason("超出校区最大教师数");
                }
                bmHandlerClassResultVoList.add(bmHandlerClassResultVo);
            }));
        }
        return bmHandlerClassResultVoList;
    }

    /**
     * 处理待分班数据
     */
    private void processHandlerClassDTOList(Map<IntentionCurTime, List<BmHandlerClassDTO>> intentionCurTimeListMap, List<BmClassroomIntention> bmClassroomIntentionList, Map<String, List<BmHandlerClassDTO>> unableHandlerClass, List<BmHandlerClassPlacementDTO> bmHandlerClassPlacementDTOList) {
        for (Map.Entry<IntentionCurTime, List<BmHandlerClassDTO>> entry : intentionCurTimeListMap.entrySet()) {
            // 意向时间
            IntentionCurTime intentionCurTime = entry.getKey();
            // 意向时间对应的分班数据
            List<BmHandlerClassDTO> handlerClassDTOList = entry.getValue();
            // 根据意向时间获取教室数据
            if (checkIntentionRoom(entry, bmClassroomIntentionList, intentionCurTime, unableHandlerClass)) continue;

            // 校验教室容量是否满足
            List<BmClassroomIntention> bmClassroomIntentionList2 = bmClassroomIntentionService.getClassIntentionListByIntentionCurTime(intentionCurTime);
            handlerClassDTOList = checkExceedTotalSize(entry, bmClassroomIntentionList2, handlerClassDTOList, unableHandlerClass, intentionCurTime);

            // 校验教师数量是否满足
            List<BmTeacherIntention> bmTeacherIntentionList2 = bmTeacherIntentionService.getClassIntentionListByIntentionCurTime(intentionCurTime);
            handlerClassDTOList = checkExceedTeacherSize(entry, bmClassroomIntentionList2, bmTeacherIntentionList2, handlerClassDTOList, unableHandlerClass, intentionCurTime);

            // 塞入最终需要处理数据
            BmHandlerClassPlacementDTO build = BmHandlerClassPlacementDTO.builder()
                    .intentionCurTime(intentionCurTime)
                    .classroomIntentionList(bmClassroomIntentionList2)
                    .bmTeacherIntentionList(bmTeacherIntentionList2)
                    .bmHandlerClassDTOList(handlerClassDTOList).build();
            bmHandlerClassPlacementDTOList.add(build);
        }
    }

    /**
     * 校验当前校区教师是否满足
     */
    private List<BmHandlerClassDTO> checkExceedTeacherSize(Map.Entry<IntentionCurTime, List<BmHandlerClassDTO>> entry, List<BmClassroomIntention> bmClassroomIntentionList2, List<BmTeacherIntention> bmTeacherIntentionList2, List<BmHandlerClassDTO> handlerClassDTOList, Map<String, List<BmHandlerClassDTO>> unableHandlerClass, IntentionCurTime intentionCurTime) {
        bmClassroomIntentionList2.sort(Comparator.comparing(BmClassroomIntention::getRoomSize).reversed());
        // 同时最大上课老师数
        int maxTeacherSize = bmTeacherIntentionList2.size();
        // 取出教室
        List<BmClassroomIntention> classroomIntentionList = bmClassroomIntentionList2.stream().limit(maxTeacherSize).collect(Collectors.toList());
        bmClassroomIntentionList2.clear();
        bmClassroomIntentionList2.addAll(classroomIntentionList);

        int maxStuSize = bmClassroomIntentionList2.stream().mapToInt(BmClassroomIntention::getRoomSize).sum();
        if (handlerClassDTOList.size() > maxStuSize) {
            List<BmHandlerClassDTO> exceedList = handlerClassDTOList.subList(maxStuSize, handlerClassDTOList.size());
            handlerClassDTOList = handlerClassDTOList.subList(0, maxStuSize);
            unableHandlerClass.put(HandlerClassConstant.EXCEED_INTENTION_TEACHER, exceedList);
            log.warn("当前意向时间已经超过校区内最大老师数量，记录数据-意向时间：【{}】 - 人数：【{}】", intentionCurTime, entry.getValue().size());
        }
        return handlerClassDTOList;
    }

    /**
     * 校验空闲教室的容量是否满足
     */
    private List<BmHandlerClassDTO> checkExceedTotalSize(Map.Entry<IntentionCurTime, List<BmHandlerClassDTO>> entry, List<BmClassroomIntention> bmClassroomIntentionList2, List<BmHandlerClassDTO> handlerClassDTOList, Map<String, List<BmHandlerClassDTO>> unableHandlerClass, IntentionCurTime intentionCurTime) {
        // 当前意向时间最大空闲教室承载量
        int sumRoomSize = bmClassroomIntentionList2.stream().mapToInt(BmClassroomIntention::getRoomSize).sum();

        // 如果当前意向时间对应的待分班数据超过最大承载量，记录无法分班数据
        int currentToHandlerSize = handlerClassDTOList.size();

        if (sumRoomSize < currentToHandlerSize) {
            // 超出数量
            int exceedSize = currentToHandlerSize - sumRoomSize;
            // 处理集合
            List<BmHandlerClassDTO> exceedList = handlerClassDTOList.stream().limit(exceedSize).collect(Collectors.toList());
            // 处理当前数据 減去多出的数据
            handlerClassDTOList = handlerClassDTOList.subList(0, currentToHandlerSize - exceedSize);
            // 记录超出数据
            unableHandlerClass.put(HandlerClassConstant.EXCEED_INTENTION_CLASSROOM, exceedList);
            log.warn("空闲教室容量不满足此次分班，记录数据-意向时间：【{}】 - 人数：【{}】", intentionCurTime, entry.getValue().size());
        }
        return handlerClassDTOList;
    }

    /**
     * 校验当前意向时间是否有空闲教室
     */
    private boolean checkIntentionRoom(Map.Entry<IntentionCurTime, List<BmHandlerClassDTO>> entry, List<BmClassroomIntention> bmClassroomIntentionList, IntentionCurTime intentionCurTime, Map<String, List<BmHandlerClassDTO>> unableHandlerClass) {
        BmClassroomIntention bmClassroomIntention = bmClassroomIntentionList
                .stream()
                .filter(classroomIntention -> classroomIntention.getIntentionCurTime().equals(intentionCurTime))
                .findFirst().orElse(null);

        // 当前意向时间没有空闲教室，记录数据
        if (Objects.isNull(bmClassroomIntention)) {
            // 记录数据
            unableHandlerClass.put(HandlerClassConstant.NONE_INTENTION_CLASSROOM, entry.getValue());
            log.warn("当前意向时间没有对应的教室，记录数据-意向时间：【{}】 - 人数：【{}】", intentionCurTime, entry.getValue().size());
            return true;
        }
        return false;
    }

    /**
     * 基础参数校验
     */
    private List<BmClassroomIntention> verifyBaseParam(List<BmHandlerClassDTO> bmHandlerClassDTOList, List<Long> handlerIdList) {
        // 校验参数是否正确  规则为：相同的课程类型和课程归属类型
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

        // 获取此机构下所有教师数量
        List<BmTeacherDTO> bmTeacherDTOList = bmTeacherService.getAllTeacherByOrgId(bmTeacherDTO.getTeaOrgId());
        List<Long> teacherIdList = bmTeacherDTOList.stream().map(BmTeacherDTO::getId).collect(Collectors.toList());
        // 校验教师数量
        if (bmTeacherDTOList.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前机构下没有教师,无法进行分班");
        }

        // 3.获取当前校区教室数量 暂且仅有用户有租户概念，其他均无，后续可能会进行优化
        List<BmClassroomDTO> bmClassroomDTOList = bmClassroomService.getAllClassroomByOrgId();
        List<Long> bmClassroomIdList = bmClassroomDTOList.stream().map(BmClassroomDTO::getId).collect(Collectors.toList());
        if (bmClassroomDTOList.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前校区没有教室,无法进行分班");
        }

        // 判断此时意向时间是否有空闲教室与教师
        return verifyIntention(bmHandlerClassDTOList, bmClassroomIdList, teacherIdList);
    }

    /**
     * 根据入参判断当前的空闲教室与教师
     */
    private List<BmClassroomIntention> verifyIntention(List<BmHandlerClassDTO> bmHandlerClassDTOList, List<Long> bmClassroomIdList, List<Long> teacherIdList) {
        // 根据当前待分班数据，取出意向时间，教师与教室是否同时满足
        List<IntentionCurTime> intentionCurTimeList = bmHandlerClassDTOList
                .stream()
                .map(BmHandlerClassDTO::getIntentionCurTime)
                .collect(Collectors.toList());
        // 查询教师与教室此时是否有空闲时间
        List<BmClassroomIntention> bmClassroomIntentionList = bmClassroomIntentionService.getClassIntentionListByListParam(bmClassroomIdList, intentionCurTimeList);
        if (bmClassroomIntentionList.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前校区没有空闲教室,无法进行分班");
        }

        // 处理教师意向时间列表
        List<BmTeacherIntention> bmTeacherIntentionList = bmTeacherIntentionService.getTeacherIntentionListByListParam(teacherIdList, intentionCurTimeList);
        if (bmTeacherIntentionList.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前校区没有空闲老师,无法进行分班");
        }
        return bmClassroomIntentionList;
    }
}


//        1,
//        2,
//        1651460565631136,
//        1651475497353376,
//        1651475612696736,
//        1651475673514144,
//        1651475698679968,
//        1651475728040032,
//        1651475755303072,
//        1651475793051808,
//        1651475816120480,
//        1651475843383456
