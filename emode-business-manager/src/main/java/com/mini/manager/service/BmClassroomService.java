package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.org.BmClassroom;
import com.mini.pojo.model.dto.org.BmClassroomDTO;
import com.mini.pojo.model.query.org.BmClassroomQuery;
import com.mini.pojo.model.vo.org.BmClassroomDetailVo;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 教室表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
public interface BmClassroomService extends IService<BmClassroom> {

    /**
     * 增
     */
    BmClassroomDTO add(BmClassroomDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmClassroomDTO dto);

    /**
     * 查
     */
    BmClassroomDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmClassroomDTO> page(BmClassroomQuery query);

    /**
     * 获取当前所有教室数量
     */
    List<BmClassroomDTO> getAllClassroomByOrgId();

    /**
     * 根据教室集合获取以教室id为key的map集合
     */
    Map<Long, BmClassroom> selectByIdList(List<Long> classroomIdList);

    /**
     * 根据教室 id 查询教室意向详情时间
     */
    BmClassroomDetailVo selectClassroomIntentionById(Long id);
}
