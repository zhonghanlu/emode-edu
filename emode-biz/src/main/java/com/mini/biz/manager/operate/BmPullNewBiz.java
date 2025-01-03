package com.mini.biz.manager.operate;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmPullNewService;
import com.mini.pojo.mapper.operate.BmPullNewStructMapper;
import com.mini.pojo.model.dto.operate.BmPullNewDTO;
import com.mini.pojo.model.edit.operate.BmPullNewEdit;
import com.mini.pojo.model.query.operate.BmPullNewQuery;
import com.mini.pojo.model.request.operate.BmPullNewRequest;
import com.mini.pojo.model.vo.operate.BmPullNewVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 20:25
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmPullNewBiz {

    private final BmPullNewService bmPullNewService;

    /**
     * 分页
     */
    public IPage<BmPullNewVo> page(BmPullNewQuery query) {
        IPage<BmPullNewDTO> page = bmPullNewService.page(query);
        return page.convert(BmPullNewStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条拉新详情
     */
    public BmPullNewVo getEntityById(Long id) {
        BmPullNewDTO bmPullNewDTO = bmPullNewService.selectById(id);
        return BmPullNewStructMapper.INSTANCE.dto2Vo(bmPullNewDTO);
    }

    /**
     * 新增拉新信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmPullNewRequest request) {
        bmPullNewService.add(BmPullNewStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmPullNewService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmPullNewEdit edit) {
        bmPullNewService.update(BmPullNewStructMapper.INSTANCE.edit2Dto(edit));
    }

}
