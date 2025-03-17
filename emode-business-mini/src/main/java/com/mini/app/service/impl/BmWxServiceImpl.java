package com.mini.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.app.mapper.BmWxMapper;
import com.mini.app.service.BmWxService;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.LastSql;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.pojo.entity.app.BmWx;
import com.mini.pojo.mapper.wx.BmWxStructMapper;
import com.mini.pojo.model.dto.wx.BmWxDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * <p>
 * 微信用户数据 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2025-02-26
 */
@Service
@RequiredArgsConstructor
public class BmWxServiceImpl extends ServiceImpl<BmWxMapper, BmWx> implements BmWxService {

    private final BmWxMapper bmWxMapper;

    @Override
    public BmWxDTO selectByPhoneNumber(Long phoneNumber) {
        LambdaQueryWrapper<BmWx> wrapper = Wrappers.lambdaQuery(BmWx.class);
        wrapper.eq(BmWx::getPhoneNumber, phoneNumber)
                .eq(BmWx::getDelFlag, Delete.NO)
                .last(LastSql.LIMIT_ONE);
        BmWx bmWx = bmWxMapper.selectOne(wrapper);
        return BmWxStructMapper.INSTANCE.entity2Dto(bmWx);
    }

    @Override
    public BmWxDTO insert(BmWxDTO bmWxDTO) {

        BmWxDTO bmWxDTO1 = selectByPhoneNumber(bmWxDTO.getPhoneNumber());

        if (Objects.nonNull(bmWxDTO1)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前手机号已存在，禁止重复注册");
        }

        BmWx bmWx = BmWxStructMapper.INSTANCE.dto2Entity(bmWxDTO);

        bmWx.setId(IDGenerator.next());
        bmWx.setDelFlag(Delete.NO);
        bmWx.setCreateTime(LocalDateTime.now());

        int b = bmWxMapper.insert(bmWx);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
        return BmWxStructMapper.INSTANCE.entity2Dto(bmWx);
    }
}
