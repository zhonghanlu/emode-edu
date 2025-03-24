package com.mini.pojo.mapper.sale;

import com.mini.pojo.entity.sale.BmProduct;
import com.mini.pojo.model.dto.sale.BmProductAppDTO;
import com.mini.pojo.model.dto.sale.BmProductDTO;
import com.mini.pojo.model.edit.sale.BmProductEdit;
import com.mini.pojo.model.request.sale.BmProductRequest;
import com.mini.pojo.model.vo.sale.BmProductAppDetailVo;
import com.mini.pojo.model.vo.sale.BmProductAppVo;
import com.mini.pojo.model.vo.sale.BmProductVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmProductStructMapper {

    BmProductStructMapper INSTANCE = Mappers.getMapper(BmProductStructMapper.class);

    /**
     * dto2entity
     */
    BmProduct dto2Entity(BmProductDTO dto);

    /**
     * entity2dto
     */
    BmProductDTO entity2Dto(BmProduct entity);

    /**
     * dto2vo
     */
    BmProductVo dto2Vo(BmProductDTO dto);

    /**
     * req2dto
     */
    BmProductDTO req2Dto(BmProductRequest request);

    /**
     * edit2dto
     */
    BmProductDTO edit2Dto(BmProductEdit edit);

    /**
     * appDto2Vo
     */
    BmProductAppVo appDto2Vo(BmProductAppDTO bmProductAppDTO);

    /**
     * appDto2DetailVo
     */
    BmProductAppDetailVo appDto2DetailVo(BmProductDTO bmProductDTO);
}
