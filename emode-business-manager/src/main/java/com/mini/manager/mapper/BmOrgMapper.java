package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.manager.BmOrg;
import com.mini.pojo.model.dto.BmOrgDTO;
import com.mini.pojo.model.query.BmOrgQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author zhl
 * @create 2024/8/30 15:45
 */
@Mapper
public interface BmOrgMapper extends BaseMapper<BmOrg> {

    IPage<BmOrgDTO> page(@Param("query") BmOrgQuery query, Page<BmOrgDTO> page);

}
