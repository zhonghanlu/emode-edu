package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.manager.BmPatriarch;
import com.mini.pojo.model.dto.BmPatriarchDTO;
import com.mini.pojo.model.query.BmPatriarchQuery;

/**
 * <p>
 * 家长表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
public interface BmPatriarchService extends IService<BmPatriarch> {

    /**
     * 增
     */
    void add(BmPatriarchDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmPatriarchDTO dto);

    /**
     * 查
     */
    BmPatriarchDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmPatriarchDTO> page(BmPatriarchQuery query);

}
