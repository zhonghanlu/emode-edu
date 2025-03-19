package com.mini.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.app.mapper.BmWxPatriarchMapper;
import com.mini.app.service.BmWxPatriarchService;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.LastSql;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.pojo.entity.app.wx.BmWxPatriarch;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 微信用户与家长信息绑定 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2025-02-26
 */
@Service
@RequiredArgsConstructor
public class BmWxPatriarchServiceImpl extends ServiceImpl<BmWxPatriarchMapper, BmWxPatriarch> implements BmWxPatriarchService {

    private final BmWxPatriarchMapper bmWxPatriarchMapper;

    @Override
    public void add(Long patId, Long wxId) {
        BmWxPatriarch bmWxPatriarch = new BmWxPatriarch();
        bmWxPatriarch.setId(IDGenerator.next());
        bmWxPatriarch.setWxId(wxId);
        bmWxPatriarch.setPatriarchId(patId);

        int b = bmWxPatriarchMapper.insert(bmWxPatriarch);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public BmWxPatriarch selectByWxId(Long id) {
        LambdaQueryWrapper<BmWxPatriarch> wrapper = Wrappers.lambdaQuery(BmWxPatriarch.class);
        wrapper.eq(BmWxPatriarch::getWxId, id)
                .last(LastSql.LIMIT_ONE);
        return bmWxPatriarchMapper.selectOne(wrapper);
    }
}
