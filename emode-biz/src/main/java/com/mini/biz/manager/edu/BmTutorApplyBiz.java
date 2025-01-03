package com.mini.biz.manager.edu;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmTutorApplyService;
import com.mini.pojo.mapper.edu.BmTutorApplyStructMapper;
import com.mini.pojo.model.dto.edu.BmTutorApplyDTO;
import com.mini.pojo.model.edit.edu.BmTutorApplyEdit;
import com.mini.pojo.model.query.edu.BmTutorApplyQuery;
import com.mini.pojo.model.request.edu.BmTutorApplyRequest;
import com.mini.pojo.model.vo.edu.BmTutorApplyVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024年12月5日13:45:37
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmTutorApplyBiz {

    private final BmTutorApplyService bmTutorApplyService;

    /**
     * 分页
     */
    public IPage<BmTutorApplyVo> page(BmTutorApplyQuery query) {
        IPage<BmTutorApplyDTO> page = bmTutorApplyService.page(query);
        return page.convert(BmTutorApplyStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条家教详情
     */
    public BmTutorApplyVo getEntityById(Long id) {
        BmTutorApplyDTO bmTutorApplyDTO = bmTutorApplyService.selectById(id);
        return BmTutorApplyStructMapper.INSTANCE.dto2Vo(bmTutorApplyDTO);
    }

    /**
     * 新增家教信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmTutorApplyRequest request) {
        bmTutorApplyService.add(BmTutorApplyStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmTutorApplyService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmTutorApplyEdit edit) {
        bmTutorApplyService.update(BmTutorApplyStructMapper.INSTANCE.edit2Dto(edit));
    }

}
