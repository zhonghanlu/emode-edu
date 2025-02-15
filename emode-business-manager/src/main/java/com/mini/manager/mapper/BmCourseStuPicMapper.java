package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mini.pojo.entity.course.BmCourseStuPic;
import com.mini.pojo.model.vo.course.BmCourseStuPicVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 学生上课图片信息 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-12-31
 */
public interface BmCourseStuPicMapper extends BaseMapper<BmCourseStuPic> {

    List<BmCourseStuPicVo> selectByCourseId(@Param("courseId") Long courseId);
}
