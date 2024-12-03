package com.mini.pojo.mapper.sale;

import com.mini.pojo.entity.sale.BmOrder;
import com.mini.pojo.model.dto.sale.BmOrderDTO;
import com.mini.pojo.model.edit.sale.BmOrderEdit;
import com.mini.pojo.model.request.sale.BmOrderRequest;
import com.mini.pojo.model.vo.sale.BmOrderVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmOrderStructMapper {

    BmOrderStructMapper INSTANCE = Mappers.getMapper(BmOrderStructMapper.class);

    /**
     * dto2entity
     */
    BmOrder dto2Entity(BmOrderDTO dto);

    /**
     * entity2dto
     */
    BmOrderDTO entity2Dto(BmOrder entity);

    /**
     * dto2vo
     */
    BmOrderVo dto2Vo(BmOrderDTO dto);

    /**
     * req2dto
     */
    BmOrderDTO req2Dto(BmOrderRequest request);

    /**
     * edit2dto
     */
    BmOrderDTO edit2Dto(BmOrderEdit edit);
}
