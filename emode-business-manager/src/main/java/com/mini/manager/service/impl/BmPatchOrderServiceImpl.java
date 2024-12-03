package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.OrderStatus;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmPatchOrderMapper;
import com.mini.manager.service.BmPatchOrderService;
import com.mini.pojo.entity.sale.BmPatchOrder;
import com.mini.pojo.mapper.sale.BmPatchOrderStructMapper;
import com.mini.pojo.model.dto.sale.BmPatchOrderDTO;
import com.mini.pojo.model.query.sale.BmPatchOrderQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 补单（便于线下收款） 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmPatchOrderServiceImpl extends ServiceImpl<BmPatchOrderMapper, BmPatchOrder> implements BmPatchOrderService {

    private final BmPatchOrderMapper bmPatchOrderMapper;

    @Override
    public void add(BmPatchOrderDTO dto) {
        BmPatchOrder bmPatchOrder = BmPatchOrderStructMapper.INSTANCE.dto2Entity(dto);

        bmPatchOrder.setId(IDGenerator.next());
        bmPatchOrder.setDelFlag(Delete.NO);
        if (Objects.isNull(bmPatchOrder.getPatchStatus())) {
            bmPatchOrder.setPatchStatus(OrderStatus.TO_PAID);
        }

        int b = bmPatchOrderMapper.insert(bmPatchOrder);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmPatchOrder bmPatchOrder = CommonMybatisUtil.getById(id, bmPatchOrderMapper);

        if (Objects.isNull(bmPatchOrder)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmPatchOrder.setDelFlag(Delete.YES);
        int b = bmPatchOrderMapper.updateById(bmPatchOrder);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmPatchOrderDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmPatchOrderMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmPatchOrder bmPatchOrder = BmPatchOrderStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmPatchOrderMapper.updateById(bmPatchOrder);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmPatchOrderDTO selectById(long id) {
        return BmPatchOrderStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmPatchOrderMapper));
    }

    @Override
    public IPage<BmPatchOrderDTO> page(BmPatchOrderQuery query) {
        return bmPatchOrderMapper.page(query, query.build());
    }

}
