package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmHandlerClassMapper;
import com.mini.manager.service.BmHandlerClassService;
import com.mini.pojo.entity.course.BmHandlerClass;
import com.mini.pojo.mapper.course.BmHandlerClassStructMapper;
import com.mini.pojo.model.dto.course.BmHandlerClassDTO;
import com.mini.pojo.model.query.course.BmHandlerClassQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 待分班数据表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmHandlerClassServiceImpl extends ServiceImpl<BmHandlerClassMapper, BmHandlerClass> implements BmHandlerClassService {

    private final BmHandlerClassMapper bmHandlerClassMapper;

    @Override
    public void add(BmHandlerClassDTO dto) {
        BmHandlerClass bmHandlerClass = BmHandlerClassStructMapper.INSTANCE.dto2Entity(dto);

        bmHandlerClass.setId(IDGenerator.next());
        bmHandlerClass.setDelFlag(Delete.NO);

        int b = bmHandlerClassMapper.insert(bmHandlerClass);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmHandlerClass bmHandlerClass = CommonMybatisUtil.getById(id, bmHandlerClassMapper);

        if (Objects.isNull(bmHandlerClass)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmHandlerClass.setDelFlag(Delete.YES);
        int b = bmHandlerClassMapper.updateById(bmHandlerClass);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmHandlerClassDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmHandlerClassMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmHandlerClass bmHandlerClass = BmHandlerClassStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmHandlerClassMapper.updateById(bmHandlerClass);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmHandlerClassDTO selectById(long id) {
        return BmHandlerClassStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmHandlerClassMapper));
    }

    @Override
    public IPage<BmHandlerClassDTO> page(BmHandlerClassQuery query) {
        return bmHandlerClassMapper.page(query, query.build());
    }
}
