package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.operate.BmPullNew;
import com.mini.pojo.model.dto.operate.BmPullNewDTO;
import com.mini.pojo.model.query.operate.BmPullNewQuery;

/**
 * <p>
 * 拉新统一汇总表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
public interface BmPullNewService extends IService<BmPullNew> {

    /**
     * 增
     */
    void add(BmPullNewDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmPullNewDTO dto);

    /**
     * 查
     */
    BmPullNewDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmPullNewDTO> page(BmPullNewQuery query);
}
