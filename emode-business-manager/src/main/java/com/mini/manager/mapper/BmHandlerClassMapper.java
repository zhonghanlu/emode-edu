package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.manager.BmHandlerClass;
import com.mini.pojo.model.dto.BmHandlerClassDTO;
import com.mini.pojo.model.query.BmHandlerClassQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 待分班数据表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmHandlerClassMapper extends BaseMapper<BmHandlerClass> {

    IPage<BmHandlerClassDTO> page(@Param("query") BmHandlerClassQuery query, Page<BmHandlerClassDTO> build);
}
