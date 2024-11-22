package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.LastSql;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmClassGradeMapper;
import com.mini.manager.mapper.BmClassroomMapper;
import com.mini.manager.mapper.BmTeacherMapper;
import com.mini.manager.service.BmClassGradeService;
import com.mini.pojo.entity.manager.BmClassGrade;
import com.mini.pojo.entity.manager.BmClassroom;
import com.mini.pojo.entity.manager.BmTeacher;
import com.mini.pojo.mapper.BmClassGradeStructMapper;
import com.mini.pojo.model.dto.BmClassGradeDTO;
import com.mini.pojo.model.query.BmClassGradeQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 班级数据表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmClassGradeServiceImpl extends ServiceImpl<BmClassGradeMapper, BmClassGrade> implements BmClassGradeService {

    private final BmClassGradeMapper bmClassGradeMapper;

    private final BmTeacherMapper bmTeacherMapper;

    private final BmClassroomMapper bmClassroomMapper;

    @Override
    public void add(BmClassGradeDTO dto) {
        BmClassGrade bmClassGrade = BmClassGradeStructMapper.INSTANCE.dto2Entity(dto);

        // 校验名字是否重复，教室与教师是否存在
        checkExistParams(bmClassGrade);

        bmClassGrade.setId(IDGenerator.next());
        bmClassGrade.setDelFlag(Delete.NO);

        int b2 = bmClassGradeMapper.insert(bmClassGrade);

        if (b2 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmClassGrade bmClassGrade = CommonMybatisUtil.getById(id, bmClassGradeMapper);

        if (Objects.isNull(bmClassGrade)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmClassGrade.setDelFlag(Delete.YES);
        int b = bmClassGradeMapper.updateById(bmClassGrade);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmClassGradeDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmClassGradeMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmClassGrade bmClassGrade = BmClassGradeStructMapper.INSTANCE.dto2Entity(dto);

        // 校验名字是否重复，教室与教师是否存在
        checkExistParams(bmClassGrade);

        int b1 = bmClassGradeMapper.updateById(bmClassGrade);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmClassGradeDTO selectById(long id) {
        return BmClassGradeStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmClassGradeMapper));
    }

    @Override
    public IPage<BmClassGradeDTO> page(BmClassGradeQuery query) {
        return bmClassGradeMapper.page(query, query.build());
    }


    /**
     * 校验名字是否重复，教室与教师是否存在
     */
    private void checkExistParams(BmClassGrade bmClassGrade) {
        // 查询名称是否重复
        LambdaQueryWrapper<BmClassGrade> wrapper = Wrappers.lambdaQuery(BmClassGrade.class);
        wrapper.eq(BmClassGrade::getClassGradeName, bmClassGrade.getClassGradeName())
                .eq(BmClassGrade::getDelFlag, Delete.NO)
                .last(LastSql.LIMIT_ONE);
        BmClassGrade grade = bmClassGradeMapper.selectOne(wrapper);

        if (Objects.nonNull(grade)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "班级名重复，请重新输入");
        }

        // 查询教师是否存在
        if (Objects.nonNull(bmClassGrade.getTeaId())) {
            BmTeacher bmTeacher = CommonMybatisUtil.getById(bmClassGrade.getTeaId(), bmTeacherMapper);

            if (Objects.isNull(bmTeacher)) {
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前教师不存在");
            }
            bmClassGrade.setTeaName(bmTeacher.getTeaName());
        }

        // 教室是否存在
        if (Objects.nonNull(bmClassGrade.getClassroomId())) {
            BmClassroom bmClassroom = CommonMybatisUtil.getById(bmClassGrade.getClassroomId(), bmClassroomMapper);

            if (Objects.isNull(bmClassroom)) {
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前教室不存在");
            }
            bmClassGrade.setClassroomName(bmClassroom.getRoomName());
        }
    }
}
