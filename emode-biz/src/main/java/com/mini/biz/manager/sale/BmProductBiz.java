package com.mini.biz.manager.sale;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmProductService;
import com.mini.pojo.mapper.sale.BmProductStructMapper;
import com.mini.pojo.model.dto.sale.BmProductDTO;
import com.mini.pojo.model.edit.sale.BmProductEdit;
import com.mini.pojo.model.query.sale.BmProductQuery;
import com.mini.pojo.model.request.sale.BmProductRequest;
import com.mini.pojo.model.vo.sale.BmProductVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024/12/3 17:43
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmProductBiz {

    private final BmProductService bmProductService;

    /**
     * 分页
     */
    public IPage<BmProductVo> page(BmProductQuery query) {
        IPage<BmProductDTO> page = bmProductService.page(query);
        return page.convert(BmProductStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条商品详情
     */
    public BmProductVo getEntityById(Long id) {
        BmProductDTO bmProductDTO = bmProductService.selectById(id);
        return BmProductStructMapper.INSTANCE.dto2Vo(bmProductDTO);
    }

    /**
     * 新增商品信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmProductRequest request) {
        bmProductService.add(BmProductStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmProductService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmProductEdit edit) {
        bmProductService.update(BmProductStructMapper.INSTANCE.edit2Dto(edit));
    }
}
