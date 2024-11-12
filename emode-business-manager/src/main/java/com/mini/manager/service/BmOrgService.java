package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.manager.BmOrg;
import com.mini.pojo.model.dto.BmOrgDTO;
import com.mini.pojo.model.query.BmOrgQuery;

/**
 * @author zhl
 * @create 2024/8/30 15:46
 */
public interface BmOrgService extends IService<BmOrg> {

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

    /**
     * 查分页
     */
    IPage<BmOrgDTO> page(BmOrgQuery query);

}
