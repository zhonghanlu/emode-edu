package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.ApplyStatus;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmTeacherMapper;
import com.mini.manager.mapper.BmTutorApplyMapper;
import com.mini.manager.service.BmTutorApplyService;
import com.mini.pojo.entity.edu.BmTutorApply;
import com.mini.pojo.entity.org.BmTeacher;
import com.mini.pojo.mapper.edu.BmTutorApplyStructMapper;
import com.mini.pojo.model.dto.edu.BmTutorApplyDTO;
import com.mini.pojo.model.query.edu.BmTutorApplyQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 家教申请 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmTutorApplyServiceImpl extends ServiceImpl<BmTutorApplyMapper, BmTutorApply> implements BmTutorApplyService {

    private final BmTutorApplyMapper bmTutorApplyMapper;

    private final BmTeacherMapper bmTeacherMapper;

    @Override
    public void add(BmTutorApplyDTO dto) {
        BmTutorApply bmTutorApply = BmTutorApplyStructMapper.INSTANCE.dto2Entity(dto);

        // 校验申请老师是否存在
        BmTeacher bmTeacher = CommonMybatisUtil.getById(bmTutorApply.getApplyTutorId(), bmTeacherMapper);

        if (Objects.isNull(bmTeacher)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "申请家教老师不存在");
        }

        bmTutorApply.setApplyStatus(ApplyStatus.APPLY_ING);
        bmTutorApply.setApplyTutorTeaName(bmTeacher.getTeaName());

        bmTutorApply.setId(IDGenerator.next());
        bmTutorApply.setDelFlag(Delete.NO);

        int b = bmTutorApplyMapper.insert(bmTutorApply);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmTutorApply bmTutorApply = CommonMybatisUtil.getById(id, bmTutorApplyMapper);

        if (Objects.isNull(bmTutorApply)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmTutorApply.setDelFlag(Delete.YES);
        int b = bmTutorApplyMapper.updateById(bmTutorApply);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmTutorApplyDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmTutorApplyMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmTutorApply bmTutorApply = BmTutorApplyStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmTutorApplyMapper.updateById(bmTutorApply);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmTutorApplyDTO selectById(long id) {
        return BmTutorApplyStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmTutorApplyMapper));
    }

    @Override
    public IPage<BmTutorApplyDTO> page(BmTutorApplyQuery query) {
        return bmTutorApplyMapper.page(query, query.build());
    }
}
