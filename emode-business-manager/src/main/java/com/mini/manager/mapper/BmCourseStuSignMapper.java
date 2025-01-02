package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mini.pojo.entity.course.BmCourseStuSign;
import com.mini.pojo.model.edit.course.BmCourseStuSignEdit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 学生上课签到表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-12-31
 */
public interface BmCourseStuSignMapper extends BaseMapper<BmCourseStuSign> {

    int batchUpdate(@Param("courseId") Long courseId, @Param("itemList") List<BmCourseStuSignEdit.StuSignStatusInfo> stuSignStatusInfoList);

}
