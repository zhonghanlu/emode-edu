package com.mini.pojo.mapper.org;

import com.mini.pojo.entity.org.BmPatStuRelation;
import com.mini.pojo.model.dto.org.BmPatStuRelationDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmPatStuRelationStructMapper {

    BmPatStuRelationStructMapper INSTANCE = Mappers.getMapper(BmPatStuRelationStructMapper.class);

    /**
     * entityList2DtoList
     */
    List<BmPatStuRelationDTO> entityList2DtoList(List<BmPatStuRelation> bmPatStuRelationList);
}
