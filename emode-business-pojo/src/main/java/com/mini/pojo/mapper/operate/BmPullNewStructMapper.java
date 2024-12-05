package com.mini.pojo.mapper.operate;

import com.mini.pojo.entity.operate.BmPullNew;
import com.mini.pojo.model.dto.operate.BmPullNewDTO;
import com.mini.pojo.model.edit.operate.BmPullNewEdit;
import com.mini.pojo.model.request.operate.BmPullNewRequest;
import com.mini.pojo.model.vo.operate.BmPullNewVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmPullNewStructMapper {

    BmPullNewStructMapper INSTANCE = Mappers.getMapper(BmPullNewStructMapper.class);

    /**
     * dto2entity
     */
    BmPullNew dto2Entity(BmPullNewDTO dto);

    /**
     * entity2dto
     */
    BmPullNewDTO entity2Dto(BmPullNew entity);

    /**
     * dto2vo
     */
    BmPullNewVo dto2Vo(BmPullNewDTO dto);

    /**
     * req2dto
     */
    BmPullNewDTO req2Dto(BmPullNewRequest request);

    /**
     * edit2dto
     */
    BmPullNewDTO edit2Dto(BmPullNewEdit edit);
}
