package com.mini.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.course.BmStuClassGrade;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 学生和班级关系 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-20
 */
public interface BmStuClassGradeService extends IService<BmStuClassGrade> {

    /**
     * 根据班级id  查询  key 为 班级id  value 为 学生集合
     */
    Map<Long, List<BmStuClassGrade>> mapForClassGradeIdList(List<Long> classGradeIdList);

    /**
     * 根据学生 id 与班级 id 查询唯一数据
     */
    BmStuClassGrade selectByStuIdAndClassGradeId(Long stuId, Long fromClassGradeId);

    /**
     * 根据学生 id   查询 班级数据 以及 课程类型数据为空的数据 取一条
     */
    BmStuClassGrade selectByStuIdOutOne(Long stuId);
}
