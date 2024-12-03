package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.sale.BmPatchOrder;
import com.mini.pojo.model.dto.sale.BmPatchOrderDTO;
import com.mini.pojo.model.query.sale.BmPatchOrderQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 补单（便于线下收款） Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-25
 */
public interface BmPatchOrderMapper extends BaseMapper<BmPatchOrder> {

    IPage<BmPatchOrderDTO> page(@Param("query") BmPatchOrderQuery query, Page<BmPatchOrderDTO> build);
}
