package com.mini.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.course.BmLackCourse;
import com.mini.pojo.entity.course.BmRepairRelationLack;

import java.util.List;

/**
 * <p>
 * 补课关联缺课数据 服务类
 * </p>
 *
 * @author zhl
 * @since 2025-01-11
 */
public interface BmRepairRelationLackService extends IService<BmRepairRelationLack> {

    /**
     * 根据补课 id 查询缺课数据
     */
    List<BmLackCourse> selectBmLackCourseListByRepairId(Long repairId);
}
