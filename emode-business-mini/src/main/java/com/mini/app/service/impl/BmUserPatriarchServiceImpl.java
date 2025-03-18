package com.mini.app.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.app.mapper.BmUserPatriarchMapper;
import com.mini.app.service.BmUserPatriarchService;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.pojo.entity.app.wx.BmUserPatriarch;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 家长与系统用关联 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2025-02-26
 */
@Service
@RequiredArgsConstructor
public class BmUserPatriarchServiceImpl extends ServiceImpl<BmUserPatriarchMapper, BmUserPatriarch> implements BmUserPatriarchService {

    private final BmUserPatriarchMapper bmUserPatriarchMapper;

    @Override
    public void add(Long patId, Long userId) {
        BmUserPatriarch bmUserPatriarch = new BmUserPatriarch();
        bmUserPatriarch.setId(IDGenerator.next());
        bmUserPatriarch.setPatriarchId(patId);
        bmUserPatriarch.setUserId(userId);

        int b = bmUserPatriarchMapper.insert(bmUserPatriarch);
        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }
}
