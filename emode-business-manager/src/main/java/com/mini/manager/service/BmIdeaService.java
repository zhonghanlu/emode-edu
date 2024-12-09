package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.operate.BmIdea;
import com.mini.pojo.model.dto.operate.BmIdeaDTO;
import com.mini.pojo.model.query.operate.BmIdeaQuery;

/**
 * <p>
 * 意见箱表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
public interface BmIdeaService extends IService<BmIdea> {

    /**
     * 增
     */
    void add(BmIdeaDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmIdeaDTO dto);

    /**
     * 查
     */
    BmIdeaDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmIdeaDTO> page(BmIdeaQuery query);
}
