package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.sale.BmProduct;
import com.mini.pojo.model.dto.sale.BmProductAppDTO;
import com.mini.pojo.model.dto.sale.BmProductDTO;
import com.mini.pojo.model.query.sale.BmProductAppQuery;
import com.mini.pojo.model.query.sale.BmProductQuery;

/**
 * <p>
 * 课程商品表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
public interface BmProductService extends IService<BmProduct> {

    /**
     * 增
     */
    void add(BmProductDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmProductDTO dto);

    /**
     * 查
     */
    BmProductDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmProductDTO> page(BmProductQuery query);

    /**
     * 小程序课程页查分页
     */
    IPage<BmProductAppDTO> pageForApp(BmProductAppQuery query);
}
