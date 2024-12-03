package com.mini.biz.manager.sale;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmPatchOrderService;
import com.mini.pojo.mapper.sale.BmPatchOrderStructMapper;
import com.mini.pojo.model.dto.sale.BmPatchOrderDTO;
import com.mini.pojo.model.edit.sale.BmPatchOrderEdit;
import com.mini.pojo.model.query.sale.BmPatchOrderQuery;
import com.mini.pojo.model.request.sale.BmPatchOrderRequest;
import com.mini.pojo.model.vo.sale.BmPatchOrderVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024/12/3 17:42
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmPatchOrderBiz {

    private final BmPatchOrderService bmPatchOrderService;

    /**
     * 分页
     */
    public IPage<BmPatchOrderVo> page(BmPatchOrderQuery query) {
        IPage<BmPatchOrderDTO> page = bmPatchOrderService.page(query);
        return page.convert(BmPatchOrderStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmPatchOrderVo getEntityById(Long id) {
        BmPatchOrderDTO bmPatchOrderDTO = bmPatchOrderService.selectById(id);
        return BmPatchOrderStructMapper.INSTANCE.dto2Vo(bmPatchOrderDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmPatchOrderRequest request) {
        bmPatchOrderService.add(BmPatchOrderStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmPatchOrderService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmPatchOrderEdit edit) {
        bmPatchOrderService.update(BmPatchOrderStructMapper.INSTANCE.edit2Dto(edit));
    }
}
