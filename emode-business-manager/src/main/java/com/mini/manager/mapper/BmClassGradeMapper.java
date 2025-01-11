package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.pojo.entity.course.BmClassGrade;
import com.mini.pojo.model.dto.course.BmClassGradeDTO;
import com.mini.pojo.model.query.course.BmClassGradeQuery;
import com.mini.pojo.model.vo.course.BmClassGradeStuVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 班级数据表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
public interface BmClassGradeMapper extends BaseMapper<BmClassGrade> {

    IPage<BmClassGradeDTO> page(@Param("query") BmClassGradeQuery query, Page<BmClassGradeDTO> build);

    List<BmClassGradeStuVo> selectDetailForStuById(@Param("classGradeId") Long id);
}
