package com.mini.manager.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.operate.BmIdea;
import com.mini.pojo.model.dto.operate.BmIdeaDTO;
import com.mini.pojo.model.query.operate.BmIdeaQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 意见箱表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
public interface BmIdeaMapper extends BaseMapper<BmIdea> {

    IPage<BmIdeaDTO> page(@Param("query") BmIdeaQuery query, Page<BmIdeaDTO> build);
}
