package com.mini.manager.service;

import com.mini.pojo.model.dto.BmOrgDTO;

/**
 * @author zhl
 * @create 2024/8/30 15:46
 */
public interface BmOrgService {

    /**
     * 增
     */
    void add(BmOrgDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmOrgDTO dto);

    /**
     * 查
     */
    BmOrgDTO selectById(long id);

}
