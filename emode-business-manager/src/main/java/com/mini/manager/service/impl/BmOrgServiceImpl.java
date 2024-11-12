package com.mini.manager.service.impl;

import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.pojo.entity.manager.BmOrg;
import com.mini.manager.mapper.BmOrgMapper;
import com.mini.manager.service.BmOrgService;
import com.mini.pojo.mapper.BmOrgStructMapper;
import com.mini.pojo.model.dto.BmOrgDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author zhl
 * @create 2024/8/30 15:46
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmOrgServiceImpl implements BmOrgService {

    private final BmOrgMapper bmOrgMapper;

    @Override
    public void add(BmOrgDTO dto) {
        BmOrg bmOrg = BmOrgStructMapper.INSTANCE.dto2Entity(dto);

        bmOrg.setId(IDGenerator.next());

        int b = bmOrgMapper.insert(bmOrg);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
    }

    @Override
    public void update(BmOrgDTO dto) {

    }

    @Override
    public BmOrgDTO selectById(long id) {
        return null;
    }
}
