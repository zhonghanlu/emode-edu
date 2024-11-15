package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmOrgMapper;
import com.mini.manager.mapper.BmTeacherMapper;
import com.mini.manager.service.BmTeacherService;
import com.mini.pojo.entity.manager.BmOrg;
import com.mini.pojo.entity.manager.BmTeacher;
import com.mini.pojo.mapper.BmTeacherStructMapper;
import com.mini.pojo.model.dto.BmTeacherDTO;
import com.mini.pojo.model.query.BmTeacherQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 老师表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmTeacherServiceImpl extends ServiceImpl<BmTeacherMapper, BmTeacher> implements BmTeacherService {

    private final BmTeacherMapper bmTeacherMapper;

    private final BmOrgMapper bmOrgMapper;

    @Override
    public void add(BmTeacherDTO dto) {
        BmTeacher bmTeacher = BmTeacherStructMapper.INSTANCE.dto2Entity(dto);

        bmTeacher.setId(IDGenerator.next());
        bmTeacher.setDelFlag(Delete.NO);

        BmOrg bmOrg = CommonMybatisUtil.getById(bmTeacher.getTeaOrgId(), bmOrgMapper);

        if (Objects.isNull(bmOrg)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "机构不存在，id：" + bmTeacher.getTeaOrgId());
        }
        bmTeacher.setTeaOrgName(bmOrg.getOrgName());

        int b = bmTeacherMapper.insert(bmTeacher);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmTeacher bmTeacher = CommonMybatisUtil.getById(id, bmTeacherMapper);

        if (Objects.isNull(bmTeacher)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmTeacher.setDelFlag(Delete.YES);
        int b = bmTeacherMapper.updateById(bmTeacher);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmTeacherDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmTeacherMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmTeacher bmTeacher = BmTeacherStructMapper.INSTANCE.dto2Entity(dto);

        BmOrg bmOrg = CommonMybatisUtil.getById(bmTeacher.getTeaOrgId(), bmOrgMapper);

        if (Objects.isNull(bmOrg)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "机构不存在，id：" + bmTeacher.getTeaOrgId());
        }
        bmTeacher.setTeaOrgName(bmOrg.getOrgName());

        int b1 = bmTeacherMapper.updateById(bmTeacher);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmTeacherDTO selectById(long id) {
        return BmTeacherStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmTeacherMapper));
    }

    @Override
    public IPage<BmTeacherDTO> page(BmTeacherQuery query) {
        return bmTeacherMapper.page(query, query.build());
    }
}
