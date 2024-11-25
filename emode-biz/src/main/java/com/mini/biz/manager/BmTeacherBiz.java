package com.mini.biz.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.file.model.dto.SysFileDTO;
import com.mini.file.service.ISysFileService;
import com.mini.manager.service.BmTeacherService;
import com.mini.pojo.mapper.BmTeacherStructMapper;
import com.mini.pojo.model.dto.org.BmTeacherDTO;
import com.mini.pojo.model.edit.org.BmTeacherEdit;
import com.mini.pojo.model.query.org.BmTeacherQuery;
import com.mini.pojo.model.request.org.BmTeacherRequest;
import com.mini.pojo.model.vo.org.BmTeacherVo;
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
public class BmTeacherBiz {

    private final BmTeacherService bmTeacherService;

    private final ISysFileService sysFileService;

    /**
     * 分页
     */
    public IPage<BmTeacherVo> page(BmTeacherQuery query) {
        IPage<BmTeacherDTO> page = bmTeacherService.page(query);
        return page.convert(BmTeacherStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmTeacherVo getEntityById(Long id) {
        BmTeacherDTO bmTeacherDTO = bmTeacherService.selectById(id);

        if (Objects.isNull(bmTeacherDTO)) {
            return null;
        }

        SysFileDTO sysFileDTO = sysFileService.getById(bmTeacherDTO.getTeaAvatarId());

        if (Objects.nonNull(sysFileDTO)) {
            bmTeacherDTO.setTeaAvatarUrl(sysFileDTO.getFileUrl());
        }


        return BmTeacherStructMapper.INSTANCE.dto2Vo(bmTeacherDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmTeacherRequest request) {
        bmTeacherService.add(BmTeacherStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmTeacherService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmTeacherEdit edit) {
        bmTeacherService.update(BmTeacherStructMapper.INSTANCE.edit2Dto(edit));
    }
}
