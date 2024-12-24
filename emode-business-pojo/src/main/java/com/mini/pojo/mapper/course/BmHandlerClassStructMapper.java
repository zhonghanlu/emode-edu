package com.mini.pojo.mapper.course;

import com.mini.pojo.entity.course.BmHandlerClass;
import com.mini.pojo.model.dto.course.BmHandlerClassDTO;
import com.mini.pojo.model.edit.course.BmHandlerClassEdit;
import com.mini.pojo.model.vo.course.BmHandlerClassVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmHandlerClassStructMapper {

    BmHandlerClassStructMapper INSTANCE = Mappers.getMapper(BmHandlerClassStructMapper.class);

    /**
     * dto2entity
     */
    BmHandlerClass dto2Entity(BmHandlerClassDTO dto);

    /**
     * entity2dto
     */
    BmHandlerClassDTO entity2Dto(BmHandlerClass entity);

    /**
     * dto2vo
     */
    BmHandlerClassVo dto2Vo(BmHandlerClassDTO dto);

    /**
     * req2dto
     */
//    BmHandlerClassDTO req2Dto(BmHandlerClassRequest request);

    /**
     * edit2dto
     */
    BmHandlerClassDTO edit2Dto(BmHandlerClassEdit edit);

    /**
     * editList2dtoList
     */
    List<BmHandlerClassDTO> editList2DtoList(List<BmHandlerClass> entityList);

    /**
     * dtoList2EntityList
     */
    List<BmHandlerClass> dtoList2EntityList(List<BmHandlerClassDTO> dtoList);
}
