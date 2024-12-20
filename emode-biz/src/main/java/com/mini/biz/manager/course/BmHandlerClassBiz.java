package com.mini.biz.manager.course;

import com.mini.common.enums.str.ProductType;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.HandlerClassConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.HandlerClassStatus;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.redis.RedisUtils;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.*;
import com.mini.manager.service.impl.BmStuClassGradeServiceImpl;
import com.mini.pojo.entity.course.BmClassGrade;
import com.mini.pojo.entity.course.BmHandlerClass;
import com.mini.pojo.entity.course.BmStuClassGrade;
import com.mini.pojo.entity.org.BmClassroom;
import com.mini.pojo.entity.org.BmClassroomIntention;
import com.mini.pojo.entity.org.BmTeacher;
import com.mini.pojo.entity.org.BmTeacherIntention;
import com.mini.pojo.mapper.course.BmHandlerClassStructMapper;
import com.mini.pojo.model.dto.course.BmClassGradeDTO;
import com.mini.pojo.model.dto.course.BmHandlerClassDTO;
import com.mini.pojo.model.dto.course.BmHandlerClassPlacementDTO;
import com.mini.pojo.model.dto.org.BmClassroomDTO;
import com.mini.pojo.model.dto.org.BmTeacherDTO;
import com.mini.pojo.model.edit.course.BmHandlerClassEdit;
import com.mini.pojo.model.query.course.BmHandlerClassQuery;
import com.mini.pojo.model.request.course.BmHandlerClassRequest;
import com.mini.pojo.model.vo.course.BmHandlerClassResultVo;
import com.mini.pojo.model.vo.course.BmHandlerClassVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;
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
    public List<BmHandlerClassResultVo> placementClass(BmHandlerClassRequest request) {
        // 声明未能正常分班数据map   声明可以正常处理数据最终map
        Map<String, List<BmHandlerClassDTO>> unableHandlerClass = new HashMap<>();
        List<BmHandlerClassPlacementDTO> bmHandlerClassPlacementDTOList = new ArrayList<>();
        List<Long> handlerIdList = request.getHandlerIdList();

        // 1.获取待分班数据
        List<BmHandlerClassDTO> bmHandlerClassDTOList = bmHandlerClassService.getToHandlerClass(request.getCurType(), request.getProductType(), handlerIdList);

        // 基础参数校验
        List<BmClassroomIntention> bmClassroomIntentionList = verifyBaseParam(bmHandlerClassDTOList, handlerIdList);

        // 4.处理分班数据
        Map<IntentionCurTime, List<BmHandlerClassDTO>> intentionCurTimeListMap = bmHandlerClassDTOList
                .stream()
                .collect(Collectors.groupingBy(BmHandlerClassDTO::getIntentionCurTime));

        // 5.根据分班数据意向时间，针对对应的教师与教室进行划分班级
        handlerHandlerClassDTOList(intentionCurTimeListMap, bmClassroomIntentionList, unableHandlerClass, bmHandlerClassPlacementDTOList);

        // 保存数据 为预分班数据  TODO 根据待分班数据 一次减一班级的，直接为<=0
//        bmHandlerClassPlacementDTOList.forEach(bmHandlerClassPlacementDTO -> {
//            List<BmClassroomIntention> classroomIntentionList = bmHandlerClassPlacementDTO.getClassroomIntentionList();
//            List<BmTeacherIntention> bmTeacherIntentionList2 = bmHandlerClassPlacementDTO.getBmTeacherIntentionList();
//            List<BmHandlerClassDTO> bmHandlerClassDTOList1 = bmHandlerClassPlacementDTO.getBmHandlerClassDTOList();
//
//            for (int b = 0; b < classroomIntentionList.size(); b++) {
//                BmTeacherIntention bmTeacherIntention = bmTeacherIntentionList2.get(b);
//                BmClassroomIntention bmClassroomIntention = classroomIntentionList.get(b);
//
//                // 创建班级
//                BmClassGradeDTO bmClassGradeDTO = new BmClassGradeDTO();
//                bmClassGradeDTO.setId(IDGenerator.next());
//                long classSize = RedisUtils.incrAtomicValue(request.getCurType().getStringValue());
//                bmClassGradeDTO.setClassGradeName(request.getCurType().getStringValue() + classSize + "班");
//                bmClassGradeDTO.setTeaId(bmTeacherIntention.getId());
//                bmClassGradeDTO.setTeaName(bmTeacherIntention.getTeacherName());
//                bmClassGradeDTO.setClassroomId(bmClassroomIntention.getClassroomId());
//                bmClassGradeDTO.setClassroomName(bmClassroomIntention.getClassroomName());
//                bmClassGradeService.add(bmClassGradeDTO);
//
//                // 更新教师 教室意向列表数据
//                bmTeacherIntention.setClassGradeId(bmClassGradeDTO.getId());
//                bmTeacherIntention.setClassGradeName(bmClassGradeDTO.getClassGradeName());
//                bmTeacherIntentionService.updateById(bmTeacherIntention);
//
//                bmClassroomIntention.setClassGradeId(bmClassGradeDTO.getId());
//                bmClassroomIntention.setClassGradeName(bmClassGradeDTO.getClassGradeName());
//                bmClassroomIntentionService.updateById(bmClassroomIntention);
//
//
//                // 创建学生与班级关系
//                int toHandlerSize = bmHandlerClassDTOList1.size();
//                int roomSize = bmClassroomIntention.getRoomSize();
//                if (roomSize > 0 && toHandlerSize > 0) {
//                    for (BmHandlerClassDTO bmHandlerClassDTO : bmHandlerClassDTOList1) {
//                        BmStuClassGrade bmStuClassGrade = new BmStuClassGrade();
//                        bmStuClassGrade.setId(IDGenerator.next());
//                        bmStuClassGrade.setStuId(bmHandlerClassDTO.getStuId());
//                        bmStuClassGrade.setStuName(bmHandlerClassDTO.getStuName());
//                        bmStuClassGrade.setCourseType(bmHandlerClassDTO.getCurType());
//                        bmStuClassGrade.setClassGradeId(bmClassGradeDTO.getId());
//                        bmStuClassGrade.setClassGradeName(bmClassGradeDTO.getClassGradeName());
//                        bmStuClassGrade.setDelFlag(Delete.NO);
//                        boolean save = bmStuClassGradeService.save(bmStuClassGrade);
//                        if (!save) {
//                            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增学生班级关系失败");
//                        }
//                        roomSize--;
//                        toHandlerSize--;
//                    }
//                }
//                bmHandlerClassDTOList1 = bmHandlerClassDTOList1.subList(0, toHandlerSize);
//            }
//        });
//        // 更新此批学生的分班状态
//        List<BmHandlerClassDTO> toUpdate = bmHandlerClassPlacementDTOList.stream()
//                .flatMap(bmHandlerClassPlacementDTO -> bmHandlerClassPlacementDTO.getBmHandlerClassDTOList().stream())
//                .collect(Collectors.toList());
//        toUpdate.forEach(item -> item.setHandlerClassStatus(HandlerClassStatus.TO_CONFIRMED));
//        List<BmHandlerClass> bmHandlerClassList = BmHandlerClassStructMapper.INSTANCE.dtoList2EntityList(toUpdate);
//        boolean b = bmHandlerClassService.updateBatchById(bmHandlerClassList);
//        if (!b) {
//            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "待确认分班数据更新失败");
//        }

        // 返回未能分配学员信息
        List<BmHandlerClassResultVo> bmHandlerClassResultVoList = new ArrayList<>();
        if (CollectionUtils.isNotEmpty(unableHandlerClass)) {
            unableHandlerClass.forEach((key, value) -> value.forEach(item -> {
                BmHandlerClassResultVo bmHandlerClassResultVo = new BmHandlerClassResultVo();
                bmHandlerClassResultVo.setStuId(item.getStuId());
                bmHandlerClassResultVo.setStuName(item.getStuName());
                bmHandlerClassResultVo.setIntentionCurTime(item.getIntentionCurTime());
                bmHandlerClassResultVo.setCurType(item.getCurType());
                bmHandlerClassResultVo.setProductType(item.getProductType());
                bmHandlerClassResultVo.setErrorReason(key);
                bmHandlerClassResultVoList.add(bmHandlerClassResultVo);
            }));
        }
        return bmHandlerClassResultVoList;
    }

    /**
     * 处理待分班数据
     */
    private void handlerHandlerClassDTOList(Map<IntentionCurTime, List<BmHandlerClassDTO>> intentionCurTimeListMap,
                                            List<BmClassroomIntention> bmClassroomIntentionList, Map<String,
            List<BmHandlerClassDTO>> unableHandlerClass,
                                            List<BmHandlerClassPlacementDTO> bmHandlerClassPlacementDTOList) {
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
                    .bmHandlerClassDTOList(handlerClassDTOList)
                    .build();
            bmHandlerClassPlacementDTOList.add(build);
        }
    }

    /**
     * 校验当前校区教师是否满足
     */
    private List<BmHandlerClassDTO> checkExceedTeacherSize(Map.Entry<IntentionCurTime,
            List<BmHandlerClassDTO>> entry,
                                                           List<BmClassroomIntention> bmClassroomIntentionList2,
                                                           List<BmTeacherIntention> bmTeacherIntentionList2,
                                                           List<BmHandlerClassDTO> handlerClassDTOList,
                                                           Map<String, List<BmHandlerClassDTO>> unableHandlerClass,
                                                           IntentionCurTime intentionCurTime) {
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
    private List<BmHandlerClassDTO> checkExceedTotalSize(Map.Entry<IntentionCurTime,
            List<BmHandlerClassDTO>> entry,
                                                         List<BmClassroomIntention> bmClassroomIntentionList2,
                                                         List<BmHandlerClassDTO> handlerClassDTOList, Map<String,
            List<BmHandlerClassDTO>> unableHandlerClass,
                                                         IntentionCurTime intentionCurTime) {
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
    private boolean checkIntentionRoom(Map.Entry<IntentionCurTime, List<BmHandlerClassDTO>> entry,
                                       List<BmClassroomIntention> bmClassroomIntentionList,
                                       IntentionCurTime intentionCurTime,
                                       Map<String, List<BmHandlerClassDTO>> unableHandlerClass) {
        BmClassroomIntention bmClassroomIntention = bmClassroomIntentionList
                .stream()
                .filter(classroomIntention -> classroomIntention.getIntentionCurTime().equals(intentionCurTime))
                .findFirst()
                .orElse(null);

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
        List<Long> teacherIdList = bmTeacherDTOList
                .stream()
                .map(BmTeacherDTO::getId)
                .collect(Collectors.toList());
        // 校验教师数量
        if (bmTeacherDTOList.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前机构下没有教师,无法进行分班");
        }

        // 3.获取当前校区教室数量 暂且仅有用户有租户概念，其他均无，后续可能会进行优化
        List<BmClassroomDTO> bmClassroomDTOList = bmClassroomService.getAllClassroomByOrgId();
        List<Long> bmClassroomIdList = bmClassroomDTOList
                .stream()
                .map(BmClassroomDTO::getId)
                .collect(Collectors.toList());
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
        List<BmClassroomIntention> bmClassroomIntentionList = bmClassroomIntentionService.getClassIntentionListByListParam(bmClassroomIdList,
                intentionCurTimeList);
        if (bmClassroomIntentionList.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前校区没有空闲教室,无法进行分班");
        }

        // 处理教师意向时间列表
        List<BmTeacherIntention> bmTeacherIntentionList = bmTeacherIntentionService.getTeacherIntentionListByListParam(teacherIdList,
                intentionCurTimeList);
        if (bmTeacherIntentionList.isEmpty()) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前校区没有空闲老师,无法进行分班");
        }
        return bmClassroomIntentionList;
    }

    public static void main(String[] args) {
        List<Long> list = Arrays.asList(1L, 2L, 3L, 4L);

        System.out.println(list.subList(0, 3));


//        1651460565631136,
//                1651475497353376,
//                1651475612696736,
//                1651475673514144,
//                1651475698679968,
//                1651475728040032,
//                1651475755303072,
//                1651475793051808,
//                1651475816120480,
//                1651475843383456

    }


//    // TODO  获取结果数据，将结果数据根据课程类型进行分批，根据数量进行排序，根据教室数量分配 一个教室分配一个教室与教室，多出数据返回
//    // 根据课程类型进行分组，根据教室数量取分组数据
//    List<BmHandlerClassPlacementDTO> resultDTOList = new ArrayList<>();
//        bmHandlerClassPlacementDTOList.forEach(item -> {
//        List<BmHandlerClassDTO> bmHandlerClassDTOList1 = item.getBmHandlerClassDTOList();
//        // 根据课程类型进行分组 ，待分班数据最多的放在最前面，有序map
//        Map<CourseType, List<BmHandlerClassDTO>> courseTypeListMap = bmHandlerClassDTOList1
//                .stream()
//                .collect(Collectors.groupingBy(BmHandlerClassDTO::getCurType));
//
//        // 将分组后的结果转换为 List 并按照 value 的 size 大小进行排序
//        List<Map.Entry<CourseType, List<BmHandlerClassDTO>>> sortedEntries = new ArrayList<>(courseTypeListMap.entrySet());
//        sortedEntries.sort((entry1, entry2) -> Integer.compare(entry2.getValue().size(), entry1.getValue().size()));
//
//        // 将排序后的结果放入 LinkedHashMap 中
//        Map<CourseType, List<BmHandlerClassDTO>> orderedMap = new LinkedHashMap<>();
//        for (Map.Entry<CourseType, List<BmHandlerClassDTO>> entry : sortedEntries) {
//            orderedMap.put(entry.getKey(), entry.getValue());
//        }
//
//        // 对结果数据进行选择班级 与教师  已知当前的教师与教室完全足够分班
//        orderedMap.forEach((key, value) -> {
//            // 需要的教室
//            List<BmClassroomIntention> needClassroomList = new ArrayList<>();
//            int needHandlerClassSize = value.size();
//
//            List<BmClassroomIntention> classroomIntentionList = item.getClassroomIntentionList();
//            Iterator<BmClassroomIntention> iterator = classroomIntentionList.iterator();
//
//            while (needHandlerClassSize > 0 && iterator.hasNext()) {
//                BmClassroomIntention classroomIntention = iterator.next();
//                Integer roomSize = classroomIntention.getRoomSize();
//                if (roomSize >= needHandlerClassSize) {
//                    needClassroomList.add(classroomIntention);
//
//                    // 封装入库数据
//
//
//                    break; // 分配完所需的所有学生后退出循环
//                } else {
//                    needHandlerClassSize -= roomSize;
//                    needClassroomList.add(classroomIntention);
//                }
//                iterator.remove(); // 移除已分配的教室意图
//            }
//            // 如果还有剩余的学生，记录无法分配的数据
//            if (needHandlerClassSize > 0) {
//                unableHandlerClass.computeIfAbsent(key.toString(), k -> new ArrayList<>()).addAll(value.subList(value.size() - needHandlerClassSize, value.size()));
//                log.warn("无法分配所有学生到教室，课程类型：【{}】 - 剩余人数：【{}】", key, needHandlerClassSize);
//            }
//
//            // 封装结果数据
//        });
//    });
}
