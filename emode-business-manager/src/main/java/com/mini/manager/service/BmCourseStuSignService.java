package com.mini.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.course.BmCourseStuSign;
import com.mini.pojo.model.edit.course.BmCourseStuSignEdit;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 学生上课签到表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-31
 */
public interface BmCourseStuSignService extends IService<BmCourseStuSign> {

    /**
     * 批量更新签到信息
     */
    int batchUpdate(Long courseId, List<BmCourseStuSignEdit.StuSignStatusInfo> stuSignStatusInfoList);

    /**
     * 根据学生id获取map
     */
    Map<Long, BmCourseStuSign> selectByIdListForMap(Long courseId, List<Long> stuIdList);
}
