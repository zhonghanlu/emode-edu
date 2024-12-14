package com.mini.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.common.enums.str.CourseType;
import com.mini.pojo.entity.org.BmStuClassHour;

import java.util.Map;

/**
 * <p>
 * 学生与课时关系 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-12
 */
public interface BmStuClassHourService extends IService<BmStuClassHour> {

    /**
     * 根据学生 id  获取学生所有课时信息
     */
    Map<CourseType, Long> getAllTypeClassHour(long stuId);


    /**
     * 根据学生 id 和课时类型  获取学生此课时所有信息
     */
    BmStuClassHour getTypeClassHour(long stuId, CourseType courseType);

    /**
     * 根据学生 id 和课时类型 进行增加课时，没有此类型，进行新增操作
     */
    void handlerStuClassHour(long stuId, CourseType courseType, Integer optType, long classHour, String phone);
}
