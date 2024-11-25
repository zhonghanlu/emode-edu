package com.mini.manager.service.impl;

import com.mini.manager.mapper.BmOrderMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.manager.service.BmOrderService;
import com.mini.pojo.entity.sale.BmOrder;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Service
public class BmOrderServiceImpl extends ServiceImpl<BmOrderMapper, BmOrder> implements BmOrderService {

}
