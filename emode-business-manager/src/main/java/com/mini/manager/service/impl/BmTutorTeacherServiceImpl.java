package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmTutorTeacherMapper;
import com.mini.manager.service.BmTutorTeacherService;
import com.mini.pojo.entity.edu.BmTutorTeacher;
import com.mini.pojo.mapper.edu.BmTutorTeacherStructMapper;
import com.mini.pojo.model.dto.edu.BmTutorTeacherDTO;
import com.mini.pojo.model.query.edu.BmTutorTeacherQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 家教老师 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmTutorTeacherServiceImpl extends ServiceImpl<BmTutorTeacherMapper, BmTutorTeacher> implements BmTutorTeacherService {

    private final BmTutorTeacherMapper bmTutorTeacherMapper;

    @Override
    public void add(BmTutorTeacherDTO dto) {
        BmTutorTeacher bmTutorTeacher = BmTutorTeacherStructMapper.INSTANCE.dto2Entity(dto);

        bmTutorTeacher.setId(IDGenerator.next());
        bmTutorTeacher.setDelFlag(Delete.NO);

        int b = bmTutorTeacherMapper.insert(bmTutorTeacher);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmTutorTeacher bmTutorTeacher = CommonMybatisUtil.getById(id, bmTutorTeacherMapper);

        if (Objects.isNull(bmTutorTeacher)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmTutorTeacher.setDelFlag(Delete.YES);
        int b = bmTutorTeacherMapper.updateById(bmTutorTeacher);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmTutorTeacherDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmTutorTeacherMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmTutorTeacher bmTutorTeacher = BmTutorTeacherStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmTutorTeacherMapper.updateById(bmTutorTeacher);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmTutorTeacherDTO selectById(long id) {
        return BmTutorTeacherStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmTutorTeacherMapper));
    }

    @Override
    public IPage<BmTutorTeacherDTO> page(BmTutorTeacherQuery query) {
        return bmTutorTeacherMapper.page(query, query.build());
    }
}
