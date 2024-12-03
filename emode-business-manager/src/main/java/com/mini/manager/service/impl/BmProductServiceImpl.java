package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.ProductStatus;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmProductMapper;
import com.mini.manager.service.BmProductService;
import com.mini.pojo.entity.sale.BmProduct;
import com.mini.pojo.mapper.sale.BmProductStructMapper;
import com.mini.pojo.model.dto.sale.BmProductDTO;
import com.mini.pojo.model.query.sale.BmProductQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 课程商品表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmProductServiceImpl extends ServiceImpl<BmProductMapper, BmProduct> implements BmProductService {

    private final BmProductMapper bmProductMapper;

    @Override
    public void add(BmProductDTO dto) {
        BmProduct bmProduct = BmProductStructMapper.INSTANCE.dto2Entity(dto);

        bmProduct.setId(IDGenerator.next());
        bmProduct.setDelFlag(Delete.NO);
        if (Objects.isNull(bmProduct.getStatus())) {
            bmProduct.setStatus(ProductStatus.TEST);
        }

        int b = bmProductMapper.insert(bmProduct);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmProduct bmProduct = CommonMybatisUtil.getById(id, bmProductMapper);

        if (Objects.isNull(bmProduct)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmProduct.setDelFlag(Delete.YES);
        int b = bmProductMapper.updateById(bmProduct);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmProductDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmProductMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmProduct bmProduct = BmProductStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmProductMapper.updateById(bmProduct);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmProductDTO selectById(long id) {
        return BmProductStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmProductMapper));
    }

    @Override
    public IPage<BmProductDTO> page(BmProductQuery query) {
        return bmProductMapper.page(query, query.build());
    }
}
