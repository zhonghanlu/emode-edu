package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.manager.BmStudent;
import com.mini.pojo.model.dto.BmStudentDTO;
import com.mini.pojo.model.query.BmStudentQuery;

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
    void add(BmStudentDTO dto);

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

}
