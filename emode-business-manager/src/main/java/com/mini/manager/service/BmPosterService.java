package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.operate.BmPoster;
import com.mini.pojo.model.dto.operate.BmPosterDTO;
import com.mini.pojo.model.query.operate.BmPosterQuery;

/**
 * <p>
 * 海报统一管理表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
public interface BmPosterService extends IService<BmPoster> {

    /**
     * 增
     */
    void add(BmPosterDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmPosterDTO dto);

    /**
     * 查
     */
    BmPosterDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmPosterDTO> page(BmPosterQuery query);

}
