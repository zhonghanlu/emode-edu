package com.mini.biz.manager.operate;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmIdeaService;
import com.mini.pojo.mapper.operate.BmIdeaStructMapper;
import com.mini.pojo.model.dto.operate.BmIdeaDTO;
import com.mini.pojo.model.edit.operate.BmIdeaEdit;
import com.mini.pojo.model.query.operate.BmIdeaQuery;
import com.mini.pojo.model.request.operate.BmIdeaRequest;
import com.mini.pojo.model.vo.operate.BmIdeaVo;
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
public class BmIdeaBiz {

    private final BmIdeaService bmIdeaService;

    /**
     * 分页
     */
    public IPage<BmIdeaVo> page(BmIdeaQuery query) {
        IPage<BmIdeaDTO> page = bmIdeaService.page(query);
        return page.convert(BmIdeaStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条意见详情
     */
    public BmIdeaVo getEntityById(Long id) {
        BmIdeaDTO bmIdeaDTO = bmIdeaService.selectById(id);
        return BmIdeaStructMapper.INSTANCE.dto2Vo(bmIdeaDTO);
    }

    /**
     * 新增意见信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmIdeaRequest request) {
        bmIdeaService.add(BmIdeaStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmIdeaService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmIdeaEdit edit) {
        bmIdeaService.update(BmIdeaStructMapper.INSTANCE.edit2Dto(edit));
    }

}
