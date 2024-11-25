package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.course.BmCourse;
import com.mini.pojo.model.dto.course.BmCourseDTO;
import com.mini.pojo.model.query.course.BmCourseQuery;

/**
 * <p>
 * 课程表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmCourseService extends IService<BmCourse> {

    /**
     * 增
     */
    void add(BmCourseDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmCourseDTO dto);

    /**
     * 查
     */
    BmCourseDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmCourseDTO> page(BmCourseQuery query);
}
