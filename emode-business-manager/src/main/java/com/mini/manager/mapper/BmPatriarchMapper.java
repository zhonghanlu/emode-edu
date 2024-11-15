package com.mini.manager.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.manager.BmPatriarch;
import com.mini.pojo.model.dto.BmPatriarchDTO;
import com.mini.pojo.model.query.BmPatriarchQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 家长表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Mapper
public interface BmPatriarchMapper extends BaseMapper<BmPatriarch> {

    IPage<BmPatriarchDTO> page(@Param("query") BmPatriarchQuery query, Page<BmPatriarchDTO> build);
}
