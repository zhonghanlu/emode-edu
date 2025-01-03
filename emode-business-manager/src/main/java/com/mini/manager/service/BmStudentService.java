package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.org.BmStudent;
import com.mini.pojo.model.dto.org.BmStudentDTO;
import com.mini.pojo.model.query.org.BmStudentQuery;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 学生表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
public interface BmStudentService extends IService<BmStudent> {

    /**
     * 增
     */
    BmStudentDTO add(BmStudentDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmStudentDTO dto);

    /**
     * 查
     */
    BmStudentDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmStudentDTO> page(BmStudentQuery query);

    /**
     * 根据学生id查询map信息
     */
    Map<Long, BmStudent> selectByIdListForMap(List<Long> stuIdList);
}
