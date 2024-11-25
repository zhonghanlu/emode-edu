package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.course.BmCourseSchedule;
import com.mini.pojo.model.dto.course.BmCourseScheduleDTO;
import com.mini.pojo.model.query.course.BmCourseScheduleQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 课表主表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmCourseScheduleMapper extends BaseMapper<BmCourseSchedule> {

    IPage<BmCourseScheduleDTO> page(@Param("query") BmCourseScheduleQuery query, Page<BmCourseScheduleDTO> build);
}
