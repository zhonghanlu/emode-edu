package com.mini.biz.manager.course;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.*;
import com.mini.pojo.entity.course.BmClassGrade;
import com.mini.pojo.entity.course.BmStuClassGrade;
import com.mini.pojo.mapper.course.BmClassGradeStructMapper;
import com.mini.pojo.model.dto.course.BmClassGradeDTO;
import com.mini.pojo.model.dto.course.BmHandlerClassDTO;
import com.mini.pojo.model.dto.org.BmClassroomDTO;
import com.mini.pojo.model.dto.org.BmStudentDTO;
import com.mini.pojo.model.edit.course.BmClassGradeEdit;
import com.mini.pojo.model.query.course.BmClassGradeQuery;
import com.mini.pojo.model.request.course.BmClassGradeAddStuRequest;
import com.mini.pojo.model.request.course.BmClassGradeMoveOutRequest;
import com.mini.pojo.model.request.course.BmClassGradeMoveStuRequest;
import com.mini.pojo.model.request.course.BmClassGradeRequest;
import com.mini.pojo.model.vo.course.BmClassGradeStuVo;
import com.mini.pojo.model.vo.course.BmClassGradeVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * @author zhl
 * @create 2024/11/20 13:40
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmClassGradeBiz {

    private final BmClassGradeService bmClassGradeService;

    private final BmStudentService bmStudentService;

    private final BmStuClassGradeService bmStuClassGradeService;

    private final BmClassroomService bmClassroomService;

    private final BmHandlerClassService bmHandlerClassService;

    /**
     * 分页
     */
    public IPage<BmClassGradeVo> page(BmClassGradeQuery query) {
        IPage<BmClassGradeDTO> page = bmClassGradeService.page(query);
        return page.convert(BmClassGradeStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条班级详情
     */
    public BmClassGradeVo getEntityById(Long id) {
        BmClassGradeDTO bmClassGradeDTO = bmClassGradeService.selectById(id);
        return BmClassGradeStructMapper.INSTANCE.dto2Vo(bmClassGradeDTO);
    }

    /**
     * 新增班级信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmClassGradeRequest request) {
        bmClassGradeService.add(BmClassGradeStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmClassGradeService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmClassGradeEdit edit) {
        bmClassGradeService.update(BmClassGradeStructMapper.INSTANCE.edit2Dto(edit));
    }

    /**
     * 根据班级信息查询班级对应的学生信息
     */
    public List<BmClassGradeStuVo> getDetailForStuById(Long id) {
        return bmClassGradeService.selectDetailForStuById(id);
    }

    /**
     * 已经分班学生移动学生至另一个班级
     */
    @Transactional(rollbackFor = Exception.class)
    public void moveStu(BmClassGradeMoveStuRequest request) {
        Long fromClassGradeId = request.getFromClassGradeId();
        Long toClassGradeId = request.getToClassGradeId();

        // 获取学生数据
        BmStudentDTO bmStudentDTO = bmStudentService.selectById(request.getStuId());
        if (Objects.isNull(bmStudentDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生信息不存在");
        }

        // 获取两个班级数据
        Map<Long, BmClassGrade> bmClassGradeMap = bmClassGradeService.selectInfoByIdListForMap(Arrays.asList(fromClassGradeId, toClassGradeId));
        BmClassGrade fromClassGrade = bmClassGradeMap.get(fromClassGradeId);
        BmClassGrade toClassGrade = bmClassGradeMap.get(toClassGradeId);
        if (Objects.isNull(fromClassGrade) || Objects.isNull(toClassGrade)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前班级信息不存在");
        }

        // 校验两个班级数据是否为相同的课程类型
        if (!fromClassGrade.getCurType().equals(toClassGrade.getCurType())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前班级类型不一致，请重新选择");
        }

        // 校验现班级班级是否有空的位置
        checkRoomSize(toClassGradeId, toClassGrade);

        // 移动，修改学生班级
        BmStuClassGrade bmStuClassGrade = bmStuClassGradeService.selectByStuIdAndClassGradeId(request.getStuId(), fromClassGradeId);
        bmStuClassGrade.setClassGradeId(toClassGradeId);
        bmStuClassGrade.setClassGradeName(toClassGrade.getClassGradeName());
        // 数据库更新
        boolean b = bmStuClassGradeService.updateById(bmStuClassGrade);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "移动失败");
        }
    }


    /**
     * 将学生移除此班级
     */
    @Transactional(rollbackFor = Exception.class)
    public void moveOut(BmClassGradeMoveOutRequest request) {
        Long stuId = request.getStuId();
        Long classGradeId = request.getClassGradeId();

        // 校验学生和班级数据
        checkStuAndClassGradeInfo(stuId, classGradeId);

        BmStuClassGrade bmStuClassGrade = bmStuClassGradeService.selectByStuIdAndClassGradeId(request.getStuId(), classGradeId);
        bmStuClassGrade.setCourseType(null);
        bmStuClassGrade.setClassGradeId(null);
        bmStuClassGrade.setClassGradeName("");
        // 数据库更新
        boolean b = bmStuClassGradeService.updateById(bmStuClassGrade);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "移出失败");
        }
    }

    /**
     * 已经分班班级新增学生信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void classGradeAddStu(BmClassGradeAddStuRequest request) {
        Long stuId = request.getStuId();
        Long classGradeId = request.getClassGradeId();
        BmClassGradeAddStuRequest.StuType stuType = request.getStuType();

        // 获取学生数据
        BmStudentDTO bmStudentDTO = bmStudentService.selectById(stuId);
        if (Objects.isNull(bmStudentDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生信息不存在");
        }

        // 校验班级数据
        BmClassGradeDTO bmClassGradeDTO = bmClassGradeService.selectById(classGradeId);
        if (Objects.isNull(bmClassGradeDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前班级信息不存在");
        }

        switch (stuType) {
            case HANDLE_CLASS:
                handlerStuClass(bmClassGradeDTO, stuId, bmStudentDTO);
                break;
            case ALREADY_OUT:
                BmStuClassGrade bmStuClassGrade = bmStuClassGradeService.selectByStuIdOutOne(stuId);
                bmStuClassGrade.setCourseType(bmClassGradeDTO.getCurType());
                bmStuClassGrade.setClassGradeId(classGradeId);
                bmStuClassGrade.setClassGradeName(bmClassGradeDTO.getClassGradeName());
                boolean b = bmStuClassGradeService.updateById(bmStuClassGrade);
                if (!b) {
                    throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "添加失败");
                }
                break;
            default:
                throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生类型错误");
        }

    }

    /**
     * 处理班级新增学生数据，类型为待分班类型
     */
    private void handlerStuClass(BmClassGradeDTO bmClassGradeDTO, Long stuId, BmStudentDTO bmStudentDTO) {
        // 校验班级教室是否有空位
        BmClassGrade bmClassGrade = BmClassGradeStructMapper.INSTANCE.dto2Entity(bmClassGradeDTO);
        checkRoomSize(bmClassGradeDTO.getId(), bmClassGrade);

        // 获取待分班数据
        BmHandlerClassDTO bmHandlerClassDTO = bmHandlerClassService.selectByStuIdAndCurTypeAndType(stuId, bmClassGrade.getCurType(), bmClassGrade.getClassGradeType());
        if (Objects.isNull(bmHandlerClassDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生信息不存在");
        }

        // 新增学生与班级关系数据
        BmStuClassGrade bmStuClassGrade = new BmStuClassGrade();
        bmStuClassGrade.setId(IDGenerator.next());
        bmStuClassGrade.setStuId(stuId);
        bmStuClassGrade.setStuName(bmStudentDTO.getStuName());
        bmStuClassGrade.setCourseType(bmClassGrade.getCurType());
        bmStuClassGrade.setClassGradeId(bmClassGrade.getId());
        bmStuClassGrade.setClassGradeName(bmClassGrade.getClassGradeName());
        bmStuClassGrade.setDelFlag(Delete.NO);
        boolean b = bmStuClassGradeService.save(bmStuClassGrade);
        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "新增失败");
        }

        // 更新待分班数据
        bmHandlerClassService.confirmedHandlerClass(Collections.singletonList(bmHandlerClassDTO.getId()));
    }


    /**
     * 校验班级教室容量是否足够
     */
    private void checkRoomSize(Long toClassGradeId, BmClassGrade toClassGrade) {
        Map<Long, List<BmStuClassGrade>> classGradeMap = bmStuClassGradeService.mapForClassGradeIdList(Collections.singletonList(toClassGradeId));
        List<BmStuClassGrade> bmStuClassGradeList = classGradeMap.get(toClassGradeId);
        if (Objects.nonNull(bmStuClassGradeList)) {
            Long classroomId = toClassGrade.getClassroomId();
            BmClassroomDTO bmClassroomDTO = bmClassroomService.selectById(classroomId);
            if (Objects.isNull(bmClassroomDTO)) {
                throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前教室信息不存在");
            }
            if (bmStuClassGradeList.size() >= bmClassroomDTO.getRoomSize()) {
                throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前教室已满，请重新选择");
            }
        }
    }

    /**
     * 校验学生与班级数据
     */
    private void checkStuAndClassGradeInfo(Long stuId, Long classGradeId) {
        BmStudentDTO bmStudentDTO = bmStudentService.selectById(stuId);
        if (Objects.isNull(bmStudentDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生信息不存在");
        }

        BmClassGradeDTO bmClassGradeDTO = bmClassGradeService.selectById(classGradeId);
        if (Objects.isNull(bmClassGradeDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前班级信息不存在");
        }
    }
}
