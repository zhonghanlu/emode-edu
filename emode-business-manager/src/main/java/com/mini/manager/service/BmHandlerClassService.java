package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.ProductType;
import com.mini.pojo.entity.course.BmHandlerClass;
import com.mini.pojo.model.dto.course.BmHandlerClassDTO;
import com.mini.pojo.model.query.course.BmHandlerClassQuery;

import java.util.List;

/**
 * <p>
 * 待分班数据表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmHandlerClassService extends IService<BmHandlerClass> {

    /**
     * 增
     */
    void add(BmHandlerClassDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmHandlerClassDTO dto);

    /**
     * 查
     */
    BmHandlerClassDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmHandlerClassDTO> page(BmHandlerClassQuery query);

    /**
     * 获取待分班数据
     */
    List<BmHandlerClassDTO> getToHandlerClass(CourseType courseType, ProductType productType, List<Long> handlerIdList);

    /**
     * 验证学生状态
     */
    void verifyStuStatus(List<Long> handlerIdList);

    /**
     * 确认此批分班数据
     */
    void confirmedHandlerClass(List<Long> handlerIdList);

    /**
     * 根据学生 id  课程类型 课程长短期 找到唯一的待分班数据
     */
    BmHandlerClassDTO selectByStuIdAndCurTypeAndType(Long stuId, CourseType curType, ProductType classGradeType);

    /**
     * 根据学生 id  课程类型 找到唯一的待分班数据
     */
    BmHandlerClassDTO selectByStuId(Long id, CourseType courseType);
}
