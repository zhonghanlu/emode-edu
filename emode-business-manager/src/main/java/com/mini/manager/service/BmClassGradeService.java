package com.mini.manager.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.pojo.entity.course.BmClassGrade;
import com.mini.pojo.model.dto.course.BmClassGradeDTO;
import com.mini.pojo.model.query.course.BmClassGradeQuery;

import java.util.List;

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
     * 批量增
     */
    void batchAdd(List<BmClassGradeDTO> dtoList);

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

    /**
     * 根据意向时间筛选出来所有正常运行的班级
     */
    List<BmClassGradeDTO> getNormalClassGradeList(List<IntentionCurTime> intentionCurTimeList);
}
