package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmPullNewMapper;
import com.mini.manager.service.BmPullNewService;
import com.mini.pojo.entity.operate.BmPullNew;
import com.mini.pojo.mapper.operate.BmPullNewStructMapper;
import com.mini.pojo.model.dto.operate.BmPullNewDTO;
import com.mini.pojo.model.query.operate.BmPullNewQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 拉新统一汇总表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmPullNewServiceImpl extends ServiceImpl<BmPullNewMapper, BmPullNew> implements BmPullNewService {

    private final BmPullNewMapper bmPullNewMapper;

    @Override
    public void add(BmPullNewDTO dto) {
        BmPullNew bmPullNew = BmPullNewStructMapper.INSTANCE.dto2Entity(dto);

        bmPullNew.setId(IDGenerator.next());
        bmPullNew.setDelFlag(Delete.NO);

        int b2 = bmPullNewMapper.insert(bmPullNew);

        if (b2 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmPullNew bmPullNew = CommonMybatisUtil.getById(id, bmPullNewMapper);

        if (Objects.isNull(bmPullNew)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmPullNew.setDelFlag(Delete.YES);
        int b = bmPullNewMapper.updateById(bmPullNew);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmPullNewDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmPullNewMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmPullNew bmPullNew = BmPullNewStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmPullNewMapper.updateById(bmPullNew);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmPullNewDTO selectById(long id) {
        return BmPullNewStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmPullNewMapper));
    }

    @Override
    public IPage<BmPullNewDTO> page(BmPullNewQuery query) {
        return bmPullNewMapper.page(query, query.build());
    }
}
