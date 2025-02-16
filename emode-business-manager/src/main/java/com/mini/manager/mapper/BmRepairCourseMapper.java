package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.course.BmRepairCourse;
import com.mini.pojo.model.dto.course.BmRepairCourseDTO;
import com.mini.pojo.model.query.course.BmRepairCourseQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 补课数据表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmRepairCourseMapper extends BaseMapper<BmRepairCourse> {

    IPage<BmRepairCourseDTO> page(@Param("query") BmRepairCourseQuery query, Page<BmRepairCourseDTO> build);

    BmRepairCourseDTO selectDetailById(@Param("repairId") long id);
}
