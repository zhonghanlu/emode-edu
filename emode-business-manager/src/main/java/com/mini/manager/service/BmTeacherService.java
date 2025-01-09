package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.org.BmTeacher;
import com.mini.pojo.model.dto.org.BmTeacherDTO;
import com.mini.pojo.model.query.org.BmTeacherQuery;
import com.mini.pojo.model.vo.org.BmTeacherDetailVo;

import java.util.List;

/**
 * <p>
 * 老师表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
public interface BmTeacherService extends IService<BmTeacher> {

    /**
     * 增
     */
    BmTeacherDTO add(BmTeacherDTO dto);

    /**
     * 删
     */
    void del(long id);

    /**
     * 改
     */
    void update(BmTeacherDTO dto);

    /**
     * 查
     */
    BmTeacherDTO selectById(long id);

    /**
     * 查分页
     */
    IPage<BmTeacherDTO> page(BmTeacherQuery query);

    /**
     * 获取当前教师信息
     */
    BmTeacherDTO getCurrentTeacher();

    /**
     * 获取机构下所有教师数量
     */
    List<BmTeacherDTO> getAllTeacherByOrgId(Long orgId);

    /**
     * 根据教师 id 查询教师的意向详情
     */
    BmTeacherDetailVo selectTeaIntentionDetailById(Long id);
}
