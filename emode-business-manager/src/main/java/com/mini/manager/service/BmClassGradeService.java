package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.course.BmClassGrade;
import com.mini.pojo.model.dto.course.BmClassGradeDTO;
import com.mini.pojo.model.query.course.BmClassGradeQuery;

/**
 * <p>
 * 班级数据表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmClassGradeService extends IService<BmClassGrade> {

    /**
     * 增
     */
    void add(BmClassGradeDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmClassGradeDTO dto);

    /**
     * 查
     */
    BmClassGradeDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmClassGradeDTO> page(BmClassGradeQuery query);

}
