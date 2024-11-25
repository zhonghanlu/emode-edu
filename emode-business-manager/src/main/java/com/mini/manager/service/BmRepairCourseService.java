package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.course.BmRepairCourse;
import com.mini.pojo.model.dto.course.BmRepairCourseDTO;
import com.mini.pojo.model.query.course.BmRepairCourseQuery;

/**
 * <p>
 * 补课数据表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmRepairCourseService extends IService<BmRepairCourse> {

    /**
     * 增
     */
    void add(BmRepairCourseDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmRepairCourseDTO dto);

    /**
     * 查
     */
    BmRepairCourseDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmRepairCourseDTO> page(BmRepairCourseQuery query);
}
