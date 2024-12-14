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
import com.mini.manager.mapper.BmPatriarchMapper;
import com.mini.manager.service.BmPatriarchService;
import com.mini.pojo.entity.org.BmPatriarch;
import com.mini.pojo.mapper.org.BmPatriarchStructMapper;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.query.org.BmPatriarchQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 家长表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmPatriarchServiceImpl extends ServiceImpl<BmPatriarchMapper, BmPatriarch> implements BmPatriarchService {

    private final BmPatriarchMapper bmPatriarchMapper;

    @Override
    public void add(BmPatriarchDTO dto) {
        BmPatriarch bmPatriarch = BmPatriarchStructMapper.INSTANCE.dto2Entity(dto);

        // 校验手机号是否重复
        LambdaQueryWrapper<BmPatriarch> wrapper = Wrappers.lambdaQuery(BmPatriarch.class);
        wrapper.eq(BmPatriarch::getPatPhone, dto.getPatPhone())
                .last(LastSql.LIMIT_ONE);
        Long count = bmPatriarchMapper.selectCount(wrapper);

        if (count > 0) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "手机号重复，请重新输入");
        }

        bmPatriarch.setId(IDGenerator.next());
        bmPatriarch.setDelFlag(Delete.NO);

        int b = bmPatriarchMapper.insert(bmPatriarch);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmPatriarch bmPatriarch = CommonMybatisUtil.getById(id, bmPatriarchMapper);

        if (Objects.isNull(bmPatriarch)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmPatriarch.setDelFlag(Delete.YES);
        int b = bmPatriarchMapper.updateById(bmPatriarch);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmPatriarchDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmPatriarchMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmPatriarch bmPatriarch = BmPatriarchStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmPatriarchMapper.updateById(bmPatriarch);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmPatriarchDTO selectById(long id) {
        return BmPatriarchStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmPatriarchMapper));
    }

    @Override
    public IPage<BmPatriarchDTO> page(BmPatriarchQuery query) {
        return bmPatriarchMapper.page(query, query.build());
    }
}
