package com.mini.biz.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.file.model.dto.SysFileDTO;
import com.mini.file.service.ISysFileService;
import com.mini.manager.service.BmOrgService;
import com.mini.pojo.mapper.BmOrgStructMapper;
import com.mini.pojo.model.dto.BmOrgDTO;
import com.mini.pojo.model.edit.BmOrgEdit;
import com.mini.pojo.model.query.BmOrgQuery;
import com.mini.pojo.model.request.BmOrgRequest;
import com.mini.pojo.model.vo.BmOrgVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Objects;

/**
 * @author zhl
 * @create 2024/11/12 17:18
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmOrgBiz {

    private final BmOrgService bmOrgService;

    private final ISysFileService sysFileService;

    /**
     * 分页
     */
    public IPage<BmOrgVo> page(BmOrgQuery query) {
        IPage<BmOrgDTO> page = bmOrgService.page(query);
        return page.convert(BmOrgStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmOrgVo getBmOrgById(Long id) {
        BmOrgDTO bmOrgDTO = bmOrgService.selectById(id);

        if (Objects.isNull(bmOrgDTO)) {
            return null;
        }

        SysFileDTO sysFileDTO = sysFileService.getById(bmOrgDTO.getOrgBusinessLicense());

        if (Objects.nonNull(sysFileDTO)) {
            bmOrgDTO.setOrgBusinessLicenseUrl(sysFileDTO.getFileUrl());
        }

        return BmOrgStructMapper.INSTANCE.dto2Vo(bmOrgDTO);
    }

    /**
     * 新增机构信息
     */
    public void insert(BmOrgRequest request) {
        bmOrgService.add(BmOrgStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    public void del(long id) {
        bmOrgService.del(id);
    }

    /**
     * 修改信息
     */
    public void update(BmOrgEdit edit) {
        bmOrgService.update(BmOrgStructMapper.INSTANCE.edit2Dto(edit));
    }
}
