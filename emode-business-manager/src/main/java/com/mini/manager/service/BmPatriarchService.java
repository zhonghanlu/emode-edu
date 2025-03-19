package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.org.BmPatriarch;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.query.org.BmPatriarchQuery;
import com.mini.pojo.model.vo.business.BmPatriarchStuInfoVo;
import com.mini.pojo.model.vo.org.BmPatRelationStuVo;

import java.util.List;

/**
 * <p>
 * 家长表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
public interface BmPatriarchService extends IService<BmPatriarch> {

    /**
     * 增
     */
    BmPatriarchDTO add(BmPatriarchDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmPatriarchDTO dto);

    /**
     * 查
     */
    BmPatriarchDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmPatriarchDTO> page(BmPatriarchQuery query);

    /**
     * 根据家长id查询学生关联信息
     */
    BmPatRelationStuVo detailRelationStu(Long id);

    /**
     * 根据家长id查询对应孩子的最近上课信息
     */
    List<BmPatriarchStuInfoVo> selectMyChildInfo(Long patriarchId);
}
