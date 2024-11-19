package com.mini.pojo.mapper;

import com.mini.pojo.entity.manager.BmHandlerClass;
import com.mini.pojo.model.dto.BmHandlerClassDTO;
import com.mini.pojo.model.edit.BmHandlerClassEdit;
import com.mini.pojo.model.request.BmHandlerClassRequest;
import com.mini.pojo.model.vo.BmHandlerClassVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

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
    BmHandlerClassDTO req2Dto(BmHandlerClassRequest request);

    /**
     * edit2dto
     */
    BmHandlerClassDTO edit2Dto(BmHandlerClassEdit edit);
}
