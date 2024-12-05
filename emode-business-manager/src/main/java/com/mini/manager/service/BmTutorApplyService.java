package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.edu.BmTutorApply;
import com.mini.pojo.model.dto.edu.BmTutorApplyDTO;
import com.mini.pojo.model.query.edu.BmTutorApplyQuery;

/**
 * <p>
 * 家教申请 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
public interface BmTutorApplyService extends IService<BmTutorApply> {

    /**
     * 增
     */
    void add(BmTutorApplyDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmTutorApplyDTO dto);

    /**
     * 查
     */
    BmTutorApplyDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmTutorApplyDTO> page(BmTutorApplyQuery query);

}
