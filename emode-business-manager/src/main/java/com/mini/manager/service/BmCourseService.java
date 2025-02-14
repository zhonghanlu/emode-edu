package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.course.BmCourse;
import com.mini.pojo.model.dto.course.BmCourseDTO;
import com.mini.pojo.model.query.course.BmCourseQuery;
import com.mini.pojo.model.vo.course.BmCourseVo;
import com.mini.pojo.model.vo.course.BmStuCourseVo;

import java.util.List;

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

    /**
     * 课程批量新增
     */
    void batchAdd(List<BmCourseDTO> bmCourseDTOList);

    /**
     * 根据课程id查询学生信息
     */
    List<BmStuCourseVo> courseStuInfo(Long courseId);

    /**
     * 课程详细信息
     */
    BmCourseVo selectDetailById(Long id);
}
