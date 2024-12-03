package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.sale.BmPatchOrder;
import com.mini.pojo.model.dto.sale.BmPatchOrderDTO;
import com.mini.pojo.model.query.sale.BmPatchOrderQuery;

/**
 * <p>
 * 补单（便于线下收款） 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
public interface BmPatchOrderService extends IService<BmPatchOrder> {

    /**
     * 增
     */
    void add(BmPatchOrderDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmPatchOrderDTO dto);

    /**
     * 查
     */
    BmPatchOrderDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmPatchOrderDTO> page(BmPatchOrderQuery query);


}
