package com.mini.biz.manager.course;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.StuClassHourConstant;
import com.mini.common.enums.str.YesOrNo;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.*;
import com.mini.pojo.entity.course.BmLackCourse;
import com.mini.pojo.entity.course.BmRepairCourse;
import com.mini.pojo.entity.course.BmRepairRelationFile;
import com.mini.pojo.entity.course.BmRepairRelationLack;
import com.mini.pojo.mapper.course.BmRepairCourseStructMapper;
import com.mini.pojo.model.dto.course.BmLackCourseDTO;
import com.mini.pojo.model.dto.course.BmRepairCourseDTO;
import com.mini.pojo.model.edit.course.BmRepairCourseEdit;
import com.mini.pojo.model.query.course.BmRepairCourseQuery;
import com.mini.pojo.model.request.course.BmRepairCourseFinishRequest;
import com.mini.pojo.model.request.course.BmRepairCourseRequest;
import com.mini.pojo.model.request.course.BmRepairCourseUploadFileRequest;
import com.mini.pojo.model.vo.course.BmRepairCourseVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author zhl
 * @create 2024/11/20 14:22
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmRepairCourseBiz {

    private final BmRepairCourseService bmRepairCourseService;

    private final BmLackCourseService bmLackCourseService;

    private final BmRepairRelationLackService bmRepairRelationLackService;

    private final BmRepairRelationFileService bmRepairRelationFileService;

    private final BmStudentService bmStudentService;

    private final BmStuClassHourService bmStuClassHourService;

    /**
     * 分页
     */
    public IPage<BmRepairCourseVo> page(BmRepairCourseQuery query) {
        IPage<BmRepairCourseDTO> page = bmRepairCourseService.page(query);
        return page.convert(BmRepairCourseStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条补课详情
     */
    public BmRepairCourseVo getEntityById(Long id) {
        BmRepairCourseDTO bmRepairCourseDTO = bmRepairCourseService.selectById(id);
        return BmRepairCourseStructMapper.INSTANCE.dto2Vo(bmRepairCourseDTO);
    }

    /**
     * 新增补课信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmRepairCourseRequest request) {
        LocalDateTime repairStartTime = request.getRepairStartTime();
        LocalDateTime repairEndTime = request.getRepairEndTime();
        List<Long> lackCourseIdList = request.getLackCourseIdList();
        // 补课课时类型，与 缺课学生的课时类型一直
        List<BmLackCourseDTO> bmLackCourseDTOList = bmLackCourseService.selectByIdList(lackCourseIdList);
        bmLackCourseDTOList.forEach(item -> {
            if (!item.getCurType().equals(request.getCurType())) {
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "补课课时类型，与缺课学生的课时类型不一致");
            }
        });
        // 补课时间校验
        if (repairStartTime.isAfter(repairEndTime)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "开始时间不能大于结束时间");
        }

        // 1.新增补课信息
        BmRepairCourse bmRepairCourse = bmRepairCourseService.add(BmRepairCourseStructMapper.INSTANCE.req2Dto(request));

        // 2.新增补课与缺课 数据关联
        List<BmRepairRelationLack> bmRepairRelationLackList = new ArrayList<>();
        bmLackCourseDTOList.forEach(item -> {
            BmRepairRelationLack bmRepairRelationLack = new BmRepairRelationLack();
            bmRepairRelationLack.setRepairId(bmRepairCourse.getId());
            bmRepairRelationLack.setLackId(item.getId());
            bmRepairRelationLackList.add(bmRepairRelationLack);
        });
        boolean b = bmRepairRelationLackService.saveBatch(bmRepairRelationLackList);
        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "批量新增失败");
        }
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmRepairCourseService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmRepairCourseEdit edit) {
        bmRepairCourseService.update(BmRepairCourseStructMapper.INSTANCE.edit2Dto(edit));
    }

    /**
     * 补课的讲义与作业上传
     */
    @Transactional(rollbackFor = Exception.class)
    public void uploadFile(BmRepairCourseUploadFileRequest request) {
        Long repairId = request.getRepairId();
        BmRepairCourseDTO bmRepairCourseDTO = bmRepairCourseService.selectById(repairId);
        if (Objects.isNull(bmRepairCourseDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前补课信息不存在");
        }
        // 直接入库
        List<BmRepairRelationFile> bmRepairRelationFileList = new ArrayList<>();
        request.getFileIdList().forEach(fileId -> {
            BmRepairRelationFile bmRepairRelationFile = new BmRepairRelationFile();
            bmRepairRelationFile.setId(IDGenerator.next());
            bmRepairRelationFile.setRepairId(repairId);
            bmRepairRelationFile.setFileId(fileId);
            bmRepairRelationFileList.add(bmRepairRelationFile);
        });
        boolean b = bmRepairRelationFileService.saveBatch(bmRepairRelationFileList);
        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "批量新增失败");
        }
    }

    /**
     * 补课结束
     */
    @Transactional(rollbackFor = Exception.class)
    public void finish(BmRepairCourseFinishRequest request) {
        Long repairId = request.getRepairId();
        // 1.获取补课信息
        BmRepairCourseDTO bmRepairCourseDTO = bmRepairCourseService.selectById(repairId);
        if (Objects.isNull(bmRepairCourseDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前补课信息不存在");
        }
        // 2.获取缺课信息
        List<BmLackCourse> bmLackCourseList = bmRepairRelationLackService.selectBmLackCourseListByRepairId(repairId);
        // 3.获取对应学生信息
        List<Long> stuIdList = bmLackCourseList.stream().map(BmLackCourse::getStuId).collect(Collectors.toList());
        // 4.扣除课时
        stuIdList.forEach(stuId -> {
            // 默认扣除两课时
            bmStuClassHourService.handlerStuClassHour(stuId, bmRepairCourseDTO.getCurType(), StuClassHourConstant.SUBTRACT, 20000, "");
        });
        // 5.修改补课状态 TODO 补课缺少状态信息

        // 6.修改缺课状态
        bmLackCourseList.forEach(item -> item.setLackStatus(YesOrNo.YES));
        boolean b = bmLackCourseService.updateBatchById(bmLackCourseList);
        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "批量修改失败");
        }
    }
}
