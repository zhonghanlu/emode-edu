package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.sale.BmProduct;
import com.mini.pojo.model.dto.sale.BmProductAppDTO;
import com.mini.pojo.model.dto.sale.BmProductDTO;
import com.mini.pojo.model.query.sale.BmProductAppQuery;
import com.mini.pojo.model.query.sale.BmProductQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 课程商品表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
public interface BmProductMapper extends BaseMapper<BmProduct> {

    IPage<BmProductDTO> page(@Param("query") BmProductQuery query, Page<BmProductDTO> build);

    IPage<BmProductAppDTO> pageForApp(@Param("query") BmProductAppQuery query, Page<BmProductAppDTO> build);
}
