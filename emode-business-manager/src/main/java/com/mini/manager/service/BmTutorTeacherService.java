package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.edu.BmTutorTeacher;
import com.mini.pojo.model.dto.edu.BmTutorTeacherDTO;
import com.mini.pojo.model.query.edu.BmTutorTeacherQuery;

/**
 * <p>
 * 家教老师 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
public interface BmTutorTeacherService extends IService<BmTutorTeacher> {

    /**
     * 增
     */
    void add(BmTutorTeacherDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmTutorTeacherDTO dto);

    /**
     * 查
     */
    BmTutorTeacherDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmTutorTeacherDTO> page(BmTutorTeacherQuery query);


}
