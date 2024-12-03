package com.mini.biz.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmClassroomService;
import com.mini.pojo.mapper.org.BmClassroomStructMapper;
import com.mini.pojo.model.dto.org.BmClassroomDTO;
import com.mini.pojo.model.edit.org.BmClassroomEdit;
import com.mini.pojo.model.query.org.BmClassroomQuery;
import com.mini.pojo.model.request.org.BmClassroomRequest;
import com.mini.pojo.model.vo.org.BmClassroomVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024/11/12 17:18
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmClassroomBiz {

    private final BmClassroomService bmClassroomService;

    /**
     * 分页
     */
    public IPage<BmClassroomVo> page(BmClassroomQuery query) {
        IPage<BmClassroomDTO> page = bmClassroomService.page(query);
        return page.convert(BmClassroomStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmClassroomVo getEntityById(Long id) {
        BmClassroomDTO bmClassroomDTO = bmClassroomService.selectById(id);
        return BmClassroomStructMapper.INSTANCE.dto2Vo(bmClassroomDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmClassroomRequest request) {
        bmClassroomService.add(BmClassroomStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmClassroomService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmClassroomEdit edit) {
        bmClassroomService.update(BmClassroomStructMapper.INSTANCE.edit2Dto(edit));
    }
}
