package com.mini.biz.manager.org;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.RedisConstant;
import com.mini.common.constant.StuClassHourConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.CourseType;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.DecimalUtil;
import com.mini.common.utils.LoginUtils;
import com.mini.common.utils.redis.RedisUtils;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.file.model.dto.SysFileDTO;
import com.mini.file.service.ISysFileService;
import com.mini.manager.service.*;
import com.mini.pojo.entity.org.BmClassHourConvert;
import com.mini.pojo.entity.org.BmPatStuRelation;
import com.mini.pojo.mapper.org.BmClassHourConvertStructMapper;
import com.mini.pojo.mapper.org.BmStudentStructMapper;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.dto.org.BmStudentDTO;
import com.mini.pojo.model.edit.org.BmStudentEdit;
import com.mini.pojo.model.query.org.BmStudentQuery;
import com.mini.pojo.model.request.org.BmStuHourConvertRequest;
import com.mini.pojo.model.request.org.BmStudentRequest;
import com.mini.pojo.model.vo.org.BmClassHourConvertVo;
import com.mini.pojo.model.vo.org.BmStuClassTypeHourVo;
import com.mini.pojo.model.vo.org.BmStudentPatInfoVo;
import com.mini.pojo.model.vo.org.BmStudentVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author zhl
 * @create 2024/11/12 17:18
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmStudentBiz {

    private final BmStudentService bmStudentService;

    private final BmPatriarchService bmPatriarchService;

    private final BmPatStuRelationService bmPatStuRelationService;

    private final BmStuClassHourService bmStuClassHourService;

    private final BmClassHourConvertService bmClassHourConvertService;

    private final ISysFileService sysFileService;

    /**
     * 分页
     */
    public IPage<BmStudentVo> page(BmStudentQuery query) {
        IPage<BmStudentDTO> page = bmStudentService.page(query);
        return page.convert(BmStudentStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取学生详情
     */
    public BmStudentVo getEntityById(Long id) {
        BmStudentDTO bmStudentDTO = bmStudentService.selectById(id);
        if (Objects.nonNull(bmStudentDTO) && Objects.nonNull(bmStudentDTO.getStuAvatarId())) {
            SysFileDTO fileDTO = sysFileService.getById(bmStudentDTO.getStuAvatarId());

            if (Objects.nonNull(fileDTO)) {
                bmStudentDTO.setStuAvatarUrl(fileDTO.getFileUrl());
            }
        }
        return BmStudentStructMapper.INSTANCE.dto2Vo(bmStudentDTO);
    }

    /**
     * 新增学生信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmStudentRequest request) {
        // 校验家长信息是否存在
        BmPatriarchDTO bmPatriarchDTO = bmPatriarchService.selectById(request.getPatriarchId());

        if (Objects.isNull(bmPatriarchDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前家长信息不存在");
        }

        // 新增学生信息
        BmStudentDTO bmStudentDTO = bmStudentService.add(BmStudentStructMapper.INSTANCE.req2Dto(request));

        // 新增学生家长关联关系
        savePatStuRelation(bmPatriarchDTO, bmStudentDTO);

        // 是否开通 oj 开通进行开通 oj 账户
        if (request.getOjFlag()) {
            // TODO: 新增 OJ账户数据
        }
    }

    /**
     * 关联家长和学生
     */
    private void savePatStuRelation(BmPatriarchDTO bmPatriarchDTO, BmStudentDTO bmStudentDTO) {
        BmPatStuRelation patStuRelation = new BmPatStuRelation();
        patStuRelation.setId(IDGenerator.next());
        patStuRelation.setPatriarchId(bmPatriarchDTO.getId());
        patStuRelation.setPatriarchName(bmPatriarchDTO.getPatName());
        patStuRelation.setStudentId(bmStudentDTO.getId());
        patStuRelation.setStudentName(bmStudentDTO.getStuName());
        patStuRelation.setDelFlag(Delete.NO);

        boolean b = bmPatStuRelationService.save(patStuRelation);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增学生家长关联关系失败");
        }
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        BmStuClassTypeHourVo bmStuClassTypeHourVo = bmStudentService.searchStuClassTypeHour(id);
        if (Objects.nonNull(bmStuClassTypeHourVo) && CollectionUtils.isNotEmpty(bmStuClassTypeHourVo.getBmStuClassHourVoList())) {
            bmStuClassTypeHourVo.getBmStuClassHourVoList().forEach(item -> {
                if (item.getClassHour() > 0) {
                    throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生存在剩余课时信息，请先清空");
                }
            });
        }
        bmStudentService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmStudentEdit edit) {
        bmStudentService.update(BmStudentStructMapper.INSTANCE.edit2Dto(edit));
    }

    /**
     * 学生对应家长信息
     */
    public BmStudentPatInfoVo patriarchInfo(Long id) {
        return bmStudentService.searchPatriarchInfo(id);
    }

    /**
     * 根据学生id获取对应课时信息
     */
    public BmStuClassTypeHourVo stuClassTypeHour(Long id) {
        BmStuClassTypeHourVo bmStuClassTypeHourVo = bmStudentService.searchStuClassTypeHour(id);

        LambdaQueryWrapper<BmClassHourConvert> wrapper = Wrappers.lambdaQuery(BmClassHourConvert.class);
        wrapper.eq(BmClassHourConvert::getStuId, id);
        List<BmClassHourConvert> bmClassHourConvertList = bmClassHourConvertService.list(wrapper);

        List<BmClassHourConvertVo> bmClassHourConvertVoList = BmClassHourConvertStructMapper.INSTANCE.entityList2VoList(bmClassHourConvertList);
        bmStuClassTypeHourVo.setBmClassHourConvertVoList(bmClassHourConvertVoList);
        return bmStuClassTypeHourVo;
    }

    /**
     * 课时转换 全量转换
     * 缓存中的比例 为： cpp：2 python：1.5 scratch：1
     */
    @Transactional(rollbackFor = Exception.class)
    public void stuHourConvert(BmStuHourConvertRequest request) {
        Long stuId = request.getStuId();
        CourseType fromCourseType = request.getFromCourseType();
        CourseType toCourseType = request.getToCourseType();
        // 1.获取学生信息，判断学生信息是否存在
        BmStudentDTO bmStudentDTO = bmStudentService.selectById(stuId);
        if (Objects.isNull(bmStudentDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生信息不存在");
        }
        // 2.获取学生课程类型与课时信息 判断基础信息是否存在
        Map<CourseType, Long> allTypeClassHourMap = bmStuClassHourService.getAllTypeClassHour(stuId);
        if (Objects.isNull(allTypeClassHourMap)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生课程类型与课时信息不存在");
        }

        if (Objects.isNull(allTypeClassHourMap.get(fromCourseType))) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生需转换课程类型暂无课时信息");
        }

        Long classHour = allTypeClassHourMap.get(fromCourseType);

        if (10000 >= classHour) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生需转换课程类型课时不足1课时");
        }

        // 3.获取课时比例信息
        Double fromRatio = RedisUtils.getCacheObject(RedisConstant.COURSE_TYPE_RATIO + ":" + fromCourseType.getStringValue());
        Double toRatio = RedisUtils.getCacheObject(RedisConstant.COURSE_TYPE_RATIO + ":" + toCourseType.getStringValue());

        // 4.计算课时
        double fromClassHour = DecimalUtil.mul(classHour, fromRatio);
        double toClassHour = DecimalUtil.div2(fromClassHour, toRatio);
        // 转long
        BigDecimal divide = BigDecimal.valueOf(toClassHour).divide(new BigDecimal(10000), RoundingMode.CEILING);
        long toLongClassHour = divide.multiply(new BigDecimal(10000)).longValue();

        // 5.更新学生课程类型与课时信息
        // 减少from的课时
        Long fromId = bmStuClassHourService.handlerStuClassHour(stuId, fromCourseType, StuClassHourConstant.SUBTRACT, classHour, "");
        // 新增to课时
        Long toId = bmStuClassHourService.handlerStuClassHour(stuId, toCourseType, StuClassHourConstant.ADD, toLongClassHour, "");

        // 添加课时转换记录数据
        BmClassHourConvert bmClassHourConvert = new BmClassHourConvert();
        bmClassHourConvert.setId(IDGenerator.next());
        bmClassHourConvert.setStuId(stuId);
        bmClassHourConvert.setFromId(fromId);
        bmClassHourConvert.setFromClassHour(classHour);
        bmClassHourConvert.setFromCurType(fromCourseType);
        bmClassHourConvert.setToId(toId);
        bmClassHourConvert.setToClassHour(toLongClassHour);
        bmClassHourConvert.setToCurType(toCourseType);
        bmClassHourConvert.setModifyTime(LocalDateTime.now());
        bmClassHourConvert.setModifyBy(LoginUtils.getUserId());
        bmClassHourConvert.setModifyName(LoginUtils.getUsername());

        boolean b = bmClassHourConvertService.save(bmClassHourConvert);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增课时转换记录失败");
        }
    }
}
