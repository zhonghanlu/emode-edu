package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.sale.BmOrder;
import com.mini.pojo.model.dto.sale.BmOrderDTO;
import com.mini.pojo.model.query.sale.BmOrderQuery;

/**
 * <p>
 * 订单表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
public interface BmOrderMapper extends BaseMapper<BmOrder> {

    IPage<BmOrderDTO> page(BmOrderQuery query, Page<BmOrderDTO> build);
}
