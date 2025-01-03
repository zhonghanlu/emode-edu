package com.mini.biz.manager.operate;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmPosterService;
import com.mini.pojo.mapper.operate.BmPosterStructMapper;
import com.mini.pojo.model.dto.operate.BmPosterDTO;
import com.mini.pojo.model.edit.operate.BmPosterEdit;
import com.mini.pojo.model.query.operate.BmPosterQuery;
import com.mini.pojo.model.request.operate.BmPosterRequest;
import com.mini.pojo.model.vo.operate.BmPosterVo;
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
public class BmPosterBiz {

    private final BmPosterService bmPosterService;

    /**
     * 分页
     */
    public IPage<BmPosterVo> page(BmPosterQuery query) {
        IPage<BmPosterDTO> page = bmPosterService.page(query);
        return page.convert(BmPosterStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条海报详情
     */
    public BmPosterVo getEntityById(Long id) {
        BmPosterDTO bmPosterDTO = bmPosterService.selectById(id);
        return BmPosterStructMapper.INSTANCE.dto2Vo(bmPosterDTO);
    }

    /**
     * 新增海报信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmPosterRequest request) {
        bmPosterService.add(BmPosterStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmPosterService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmPosterEdit edit) {
        bmPosterService.update(BmPosterStructMapper.INSTANCE.edit2Dto(edit));
    }

}
