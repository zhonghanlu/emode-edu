package com.mini.manager.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.operate.BmPoster;
import com.mini.pojo.model.dto.operate.BmPosterDTO;
import com.mini.pojo.model.query.operate.BmPosterQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 海报统一管理表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
public interface BmPosterMapper extends BaseMapper<BmPoster> {

    IPage<BmPosterDTO> page(@Param("query") BmPosterQuery query, Page<BmPosterDTO> build);
}
