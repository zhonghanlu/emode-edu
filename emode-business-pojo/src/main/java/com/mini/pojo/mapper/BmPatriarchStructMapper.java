package com.mini.pojo.mapper;

import com.mini.pojo.entity.manager.BmPatriarch;
import com.mini.pojo.model.dto.BmPatriarchDTO;
import com.mini.pojo.model.edit.BmPatriarchEdit;
import com.mini.pojo.model.request.BmPatriarchRequest;
import com.mini.pojo.model.vo.BmPatriarchVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmPatriarchStructMapper {

    BmPatriarchStructMapper INSTANCE = Mappers.getMapper(BmPatriarchStructMapper.class);

    /**
     * dto2entity
     */
    BmPatriarch dto2Entity(BmPatriarchDTO dto);

    /**
     * entity2dto
     */
    BmPatriarchDTO entity2Dto(BmPatriarch entity);

    /**
     * dto2vo
     */
    BmPatriarchVo dto2Vo(BmPatriarchDTO dto);

    /**
     * req2dto
     */
    BmPatriarchDTO req2Dto(BmPatriarchRequest request);

    /**
     * edit2dto
     */
    BmPatriarchDTO edit2Dto(BmPatriarchEdit edit);
}
