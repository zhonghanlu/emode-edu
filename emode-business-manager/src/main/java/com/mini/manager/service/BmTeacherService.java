package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.manager.BmTeacher;
import com.mini.pojo.model.dto.BmTeacherDTO;
import com.mini.pojo.model.query.BmTeacherQuery;

/**
 * <p>
 * 老师表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
public interface BmTeacherService extends IService<BmTeacher> {

    /**
     * 增
     */
    void add(BmTeacherDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmTeacherDTO dto);

    /**
     * 查
     */
    BmTeacherDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmTeacherDTO> page(BmTeacherQuery query);

}
