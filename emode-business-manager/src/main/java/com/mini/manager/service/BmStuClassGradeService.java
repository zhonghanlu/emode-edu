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

    Map<Long, List<BmStuClassGrade>> mapForClassGradeIdList(List<Long> classGradeIdList);
}
