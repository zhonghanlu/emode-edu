package com.mini.manager.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mini.pojo.entity.org.BmPatStuRelation;
import com.mini.pojo.model.dto.org.BmPatStuRelationDTO;
import com.mini.pojo.model.vo.org.BmPatRelationStuInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 家长和学生关联信息表 Mapper 接口
 * </p>
 *
 * @author zhl
 * @since 2024-12-10
 */
public interface BmPatStuRelationMapper extends BaseMapper<BmPatStuRelation> {

    List<BmPatStuRelationDTO> selectByStuIdList(@Param("stuIdList") List<Long> stuIdList);

    List<BmPatRelationStuInfo> selectStuRelationStuInfo(@Param("stuIdList") List<Long> stuIdList);
}
