package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.edu.BmTutorTeacher;
import com.mini.pojo.model.dto.edu.BmTutorTeacherDTO;
import com.mini.pojo.model.query.edu.BmTutorTeacherQuery;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 家教老师 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-12-03
 */
public interface BmTutorTeacherMapper extends BaseMapper<BmTutorTeacher> {

    IPage<BmTutorTeacherDTO> page(@Param("query") BmTutorTeacherQuery query, Page<BmTutorTeacherDTO> build);
}
