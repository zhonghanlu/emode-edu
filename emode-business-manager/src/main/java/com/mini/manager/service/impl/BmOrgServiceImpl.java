package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.YesOrNo;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.pojo.entity.org.BmOrg;
import com.mini.manager.mapper.BmOrgMapper;
import com.mini.manager.service.BmOrgService;
import com.mini.pojo.mapper.org.BmOrgStructMapper;
import com.mini.pojo.model.dto.org.BmOrgDTO;
import com.mini.pojo.model.query.org.BmOrgQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * @author zhl
 * @create 2024/8/30 15:46
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmOrgServiceImpl extends ServiceImpl<BmOrgMapper, BmOrg> implements BmOrgService {

    private final BmOrgMapper bmOrgMapper;

    @Override
    public void add(BmOrgDTO dto) {
        BmOrg bmOrg = BmOrgStructMapper.INSTANCE.dto2Entity(dto);

        bmOrg.setId(IDGenerator.next());
        bmOrg.setDelFlag(Delete.NO);
        if (Objects.isNull(bmOrg.getOrgStatus())) {
            bmOrg.setOrgStatus(YesOrNo.NO);
        }

        int b = bmOrgMapper.insert(bmOrg);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmOrg bmOrg = CommonMybatisUtil.getById(id, bmOrgMapper);

        if (Objects.isNull(bmOrg)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmOrg.setDelFlag(Delete.YES);
        int b = bmOrgMapper.updateById(bmOrg);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmOrgDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmOrgMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmOrg bmOrg = BmOrgStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmOrgMapper.updateById(bmOrg);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmOrgDTO selectById(long id) {
        return BmOrgStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmOrgMapper));
    }

    @Override
    public IPage<BmOrgDTO> page(BmOrgQuery query) {
        return bmOrgMapper.page(query, query.build());
    }

}
