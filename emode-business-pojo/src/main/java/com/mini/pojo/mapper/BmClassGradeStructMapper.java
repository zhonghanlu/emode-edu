package com.mini.pojo.mapper;

import com.mini.pojo.entity.manager.BmClassGrade;
import com.mini.pojo.model.dto.BmClassGradeDTO;
import com.mini.pojo.model.edit.BmClassGradeEdit;
import com.mini.pojo.model.request.BmClassGradeRequest;
import com.mini.pojo.model.vo.BmClassGradeVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmClassGradeStructMapper {

    BmClassGradeStructMapper INSTANCE = Mappers.getMapper(BmClassGradeStructMapper.class);

    /**
     * dto2entity
     */
    BmClassGrade dto2Entity(BmClassGradeDTO dto);

    /**
     * entity2dto
     */
    BmClassGradeDTO entity2Dto(BmClassGrade entity);

    /**
     * dto2vo
     */
    BmClassGradeVo dto2Vo(BmClassGradeDTO dto);

    /**
     * req2dto
     */
    BmClassGradeDTO req2Dto(BmClassGradeRequest request);

    /**
     * edit2dto
     */
    BmClassGradeDTO edit2Dto(BmClassGradeEdit edit);
}
