package com.mini.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.app.wx.BmUserPatriarch;

/**
 * <p>
 * 家长与系统用关联 服务类
 * </p>
 *
 * @author zhl
 * @since 2025-02-26
 */
public interface BmUserPatriarchService extends IService<BmUserPatriarch> {

    /**
     * 家长与用户关联
     *
     * @param patId  家长id
     * @param userId 用户id
     */
    void add(Long patId, Long userId);
}
