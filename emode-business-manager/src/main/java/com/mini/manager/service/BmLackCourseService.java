package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.course.BmLackCourse;
import com.mini.pojo.model.dto.course.BmLackCourseDTO;
import com.mini.pojo.model.query.course.BmLackCourseQuery;

import java.util.List;

/**
 * <p>
 * 缺课数据表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmLackCourseService extends IService<BmLackCourse> {

    /**
     * 增
     */
    void add(BmLackCourseDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmLackCourseDTO dto);

    /**
     * 查
     */
    BmLackCourseDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmLackCourseDTO> page(BmLackCourseQuery query);

    /**
     * 根据 id  批量查
     */
    List<BmLackCourseDTO> selectByIdList(List<Long> lackCourseIdList);
}
