package com.mini.biz.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.file.model.dto.SysFileDTO;
import com.mini.file.service.ISysFileService;
import com.mini.manager.service.BmPatriarchService;
import com.mini.pojo.mapper.org.BmPatriarchStructMapper;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.edit.org.BmPatriarchEdit;
import com.mini.pojo.model.query.org.BmPatriarchQuery;
import com.mini.pojo.model.request.org.BmPatriarchRequest;
import com.mini.pojo.model.vo.org.BmPatriarchVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

/**
 * @author zhl
 * @create 2024/11/12 17:18
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmPatriarchBiz {

    private final BmPatriarchService bmPatriarchService;

    private final ISysFileService sysFileService;

    /**
     * 分页
     */
    public IPage<BmPatriarchVo> page(BmPatriarchQuery query) {
        IPage<BmPatriarchDTO> page = bmPatriarchService.page(query);
        return page.convert(BmPatriarchStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmPatriarchVo getEntityById(Long id) {
        BmPatriarchDTO bmPatriarchDTO = bmPatriarchService.selectById(id);

        if (Objects.isNull(bmPatriarchDTO)) {
            return null;
        }

        SysFileDTO sysFileDTO = sysFileService.getById(bmPatriarchDTO.getPatAvatarId());

        if (Objects.nonNull(sysFileDTO)) {
            bmPatriarchDTO.setPatAvatarUrl(sysFileDTO.getFileUrl());
        }

        return BmPatriarchStructMapper.INSTANCE.dto2Vo(bmPatriarchDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmPatriarchRequest request) {
        bmPatriarchService.add(BmPatriarchStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmPatriarchService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmPatriarchEdit edit) {
        bmPatriarchService.update(BmPatriarchStructMapper.INSTANCE.edit2Dto(edit));
    }
}
