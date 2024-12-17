package com.mini.manager.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.org.BmTeacher;
import com.mini.pojo.model.dto.org.BmTeacherDTO;
import com.mini.pojo.model.query.org.BmTeacherQuery;

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
}
