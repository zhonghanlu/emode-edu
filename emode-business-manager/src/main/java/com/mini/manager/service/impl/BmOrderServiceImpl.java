package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.OrderStatus;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmOrderMapper;
import com.mini.manager.service.BmOrderService;
import com.mini.pojo.entity.sale.BmOrder;
import com.mini.pojo.mapper.sale.BmOrderStructMapper;
import com.mini.pojo.model.dto.sale.BmOrderDTO;
import com.mini.pojo.model.query.sale.BmOrderQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 订单表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmOrderServiceImpl extends ServiceImpl<BmOrderMapper, BmOrder> implements BmOrderService {

    private final BmOrderMapper bmOrderMapper;

    @Override
    public void add(BmOrderDTO dto) {
        BmOrder bmOrder = BmOrderStructMapper.INSTANCE.dto2Entity(dto);

        bmOrder.setId(IDGenerator.next());
        bmOrder.setDelFlag(Delete.NO);
        if (Objects.isNull(bmOrder.getOrderStatus())) {
            bmOrder.setOrderStatus(OrderStatus.TO_PAID);
        }

        int b = bmOrderMapper.insert(bmOrder);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmOrder bmOrder = CommonMybatisUtil.getById(id, bmOrderMapper);

        if (Objects.isNull(bmOrder)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmOrder.setDelFlag(Delete.YES);
        int b = bmOrderMapper.updateById(bmOrder);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmOrderDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmOrderMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmOrder bmOrder = BmOrderStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmOrderMapper.updateById(bmOrder);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmOrderDTO selectById(long id) {
        return BmOrderStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmOrderMapper));
    }

    @Override
    public IPage<BmOrderDTO> page(BmOrderQuery query) {
        return bmOrderMapper.page(query, query.build());
    }

}
