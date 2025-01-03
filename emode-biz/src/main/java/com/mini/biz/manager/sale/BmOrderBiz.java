package com.mini.biz.manager.sale;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmOrderService;
import com.mini.pojo.mapper.sale.BmOrderStructMapper;
import com.mini.pojo.model.dto.sale.BmOrderDTO;
import com.mini.pojo.model.edit.sale.BmOrderEdit;
import com.mini.pojo.model.query.sale.BmOrderQuery;
import com.mini.pojo.model.request.sale.BmOrderRequest;
import com.mini.pojo.model.vo.sale.BmOrderVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024/12/3 17:40
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmOrderBiz {

    private final BmOrderService bmOrderService;

    /**
     * 分页
     */
    public IPage<BmOrderVo> page(BmOrderQuery query) {
        IPage<BmOrderDTO> page = bmOrderService.page(query);
        return page.convert(BmOrderStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条订单详情
     */
    public BmOrderVo getEntityById(Long id) {
        BmOrderDTO bmOrderDTO = bmOrderService.selectById(id);
        return BmOrderStructMapper.INSTANCE.dto2Vo(bmOrderDTO);
    }

    /**
     * 新增订单信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmOrderRequest request) {
        bmOrderService.add(BmOrderStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmOrderService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmOrderEdit edit) {
        bmOrderService.update(BmOrderStructMapper.INSTANCE.edit2Dto(edit));
    }

}
