package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.course.BmLackCourse;
import com.mini.pojo.model.dto.course.BmLackCourseDTO;
import com.mini.pojo.model.query.course.BmLackCourseQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 缺课数据表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmLackCourseMapper extends BaseMapper<BmLackCourse> {

    IPage<BmLackCourseDTO> page(@Param("query") BmLackCourseQuery query, Page<BmLackCourseDTO> build);
}
