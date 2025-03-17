package com.mini.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.app.BmWxPatriarch;

/**
 * <p>
 * 微信用户与家长信息绑定 服务类
 * </p>
 *
 * @author zhl
 * @since 2025-02-26
 */
public interface BmWxPatriarchService extends IService<BmWxPatriarch> {

    /**
     * 新增微信用户与家长信心绑定
     *
     * @param patId
     * @param wxId
     */
    void add(Long patId, Long wxId);
}
