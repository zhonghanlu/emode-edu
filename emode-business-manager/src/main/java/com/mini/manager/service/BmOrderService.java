package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.sale.BmOrder;
import com.mini.pojo.model.dto.sale.BmOrderDTO;
import com.mini.pojo.model.query.sale.BmOrderQuery;

/**
 * <p>
 * 订单表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
public interface BmOrderService extends IService<BmOrder> {

    /**
     * 增
     */
    void add(BmOrderDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmOrderDTO dto);

    /**
     * 查
     */
    BmOrderDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmOrderDTO> page(BmOrderQuery query);

}
