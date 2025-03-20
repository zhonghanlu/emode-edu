package com.mini.pojo.mapper.sale;

import com.mini.pojo.entity.operate.BmPoster;
import com.mini.pojo.entity.sale.BmPatchOrder;
import com.mini.pojo.model.dto.operate.BmPosterDTO;
import com.mini.pojo.model.dto.sale.BmPatchOrderDTO;
import com.mini.pojo.model.edit.sale.BmPatchOrderEdit;
import com.mini.pojo.model.request.sale.BmPatchOrderRequest;
import com.mini.pojo.model.vo.sale.BmPatchOrderVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmPatchOrderStructMapper {

    BmPatchOrderStructMapper INSTANCE = Mappers.getMapper(BmPatchOrderStructMapper.class);

    /**
     * dto2entity
     */
    BmPatchOrder dto2Entity(BmPatchOrderDTO dto);

    /**
     * entity2dto
     */
    BmPatchOrderDTO entity2Dto(BmPatchOrder entity);

    /**
     * dto2vo
     */
    BmPatchOrderVo dto2Vo(BmPatchOrderDTO dto);

    /**
     * req2dto
     */
    BmPatchOrderDTO req2Dto(BmPatchOrderRequest request);

    /**
     * edit2dto
     */
    BmPatchOrderDTO edit2Dto(BmPatchOrderEdit edit);

    /**
     * entityList2DtoList
     */
    List<BmPosterDTO> entityList2DtoList(List<BmPoster> bmPosterList);
}
