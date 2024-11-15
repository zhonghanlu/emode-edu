package com.mini.manager.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.manager.BmStudent;
import com.mini.pojo.model.dto.BmStudentDTO;
import com.mini.pojo.model.query.BmStudentQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 学生表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Mapper
public interface BmStudentMapper extends BaseMapper<BmStudent> {

    IPage<BmStudentDTO> page(@Param("query") BmStudentQuery query, Page<BmStudentDTO> build);
}
