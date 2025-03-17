package com.mini.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.app.BmWx;
import com.mini.pojo.model.dto.wx.BmWxDTO;

/**
 * <p>
 * 微信用户数据 服务类
 * </p>
 *
 * @author zhl
 * @since 2025-02-26
 */
public interface BmWxService extends IService<BmWx> {

    /**
     * 根据手机号查询微信用户
     */
    BmWxDTO selectByPhoneNumber(Long phoneNumber);

    /**
     * 插入微信用户
     */
    BmWxDTO insert(BmWxDTO bmWxDTO);
}
