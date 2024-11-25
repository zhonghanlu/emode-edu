package com.mini.manager.service.impl;

import com.mini.manager.mapper.BmPatchOrderMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.manager.service.BmPatchOrderService;
import com.mini.pojo.entity.sale.BmPatchOrder;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 补单（便于线下收款） 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Service
public class BmPatchOrderServiceImpl extends ServiceImpl<BmPatchOrderMapper, BmPatchOrder> implements BmPatchOrderService {

}
