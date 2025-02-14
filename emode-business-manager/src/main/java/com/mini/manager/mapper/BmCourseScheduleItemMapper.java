package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mini.pojo.entity.course.BmCourseScheduleItem;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 课表内容主体表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmCourseScheduleItemMapper extends BaseMapper<BmCourseScheduleItem> {

    int existsCourseScheduleItem(@Param("id") long id);
}
