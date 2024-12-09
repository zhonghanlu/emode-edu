package com.mini.manager.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.operate.BmPullNew;
import com.mini.pojo.model.dto.operate.BmPullNewDTO;
import com.mini.pojo.model.query.operate.BmPullNewQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 拉新统一汇总表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
public interface BmPullNewMapper extends BaseMapper<BmPullNew> {

    IPage<BmPullNewDTO> page(@Param("query") BmPullNewQuery query, Page<BmPullNewDTO> build);
}
