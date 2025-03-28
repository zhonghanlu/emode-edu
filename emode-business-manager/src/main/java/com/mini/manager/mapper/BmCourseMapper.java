package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.course.BmCourse;
import com.mini.pojo.model.dto.course.BmCourseDTO;
import com.mini.pojo.model.query.course.BmCourseQuery;
import com.mini.pojo.model.vo.course.BmCourseNotesVo;
import com.mini.pojo.model.vo.course.BmCourseVo;
import com.mini.pojo.model.vo.course.BmStuCourseVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 课程表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmCourseMapper extends BaseMapper<BmCourse> {

    IPage<BmCourseDTO> page(@Param("query") BmCourseQuery query, Page<BmCourseDTO> build);

    List<BmStuCourseVo> courseStuInfo(@Param("courseId") Long courseId);

    BmCourseVo selectDetailById(@Param("courseId") Long courseId);

    List<BmCourseNotesVo> selectNotesByCourseId(@Param("courseId") Long courseId);
}
