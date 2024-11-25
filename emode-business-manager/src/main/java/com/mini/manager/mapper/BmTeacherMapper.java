package com.mini.manager.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.org.BmTeacher;
import com.mini.pojo.model.dto.org.BmTeacherDTO;
import com.mini.pojo.model.query.org.BmTeacherQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 老师表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Mapper
public interface BmTeacherMapper extends BaseMapper<BmTeacher> {

    IPage<BmTeacherDTO> page(@Param("query") BmTeacherQuery query, Page<BmTeacherDTO> build);
}
