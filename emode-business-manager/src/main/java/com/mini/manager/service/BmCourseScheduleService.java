package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.manager.BmCourseSchedule;
import com.mini.pojo.model.dto.BmCourseScheduleDTO;
import com.mini.pojo.model.query.BmCourseScheduleQuery;

/**
 * <p>
 * 课表主表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmCourseScheduleService extends IService<BmCourseSchedule> {

    /**
     * 增
     */
    void add(BmCourseScheduleDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmCourseScheduleDTO dto);

    /**
     * 查
     */
    BmCourseScheduleDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmCourseScheduleDTO> page(BmCourseScheduleQuery query);
}
