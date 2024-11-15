package com.mini.manager.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.manager.BmClassroom;
import com.mini.pojo.model.dto.BmClassroomDTO;
import com.mini.pojo.model.query.BmClassroomQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 教室表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Mapper
public interface BmClassroomMapper extends BaseMapper<BmClassroom> {

    IPage<BmClassroomDTO> page(@Param("query") BmClassroomQuery query, Page<BmClassroomDTO> build);
}
