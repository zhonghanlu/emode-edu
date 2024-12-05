package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.edu.BmTutorApply;
import com.mini.pojo.model.dto.edu.BmTutorApplyDTO;
import com.mini.pojo.model.query.edu.BmTutorApplyQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 家教申请 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
public interface BmTutorApplyMapper extends BaseMapper<BmTutorApply> {

    IPage<BmTutorApplyDTO> page(@Param("query") BmTutorApplyQuery query, Page<BmTutorApplyDTO> build);
}
