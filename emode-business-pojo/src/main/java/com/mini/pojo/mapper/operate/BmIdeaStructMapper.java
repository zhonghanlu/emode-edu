package com.mini.pojo.mapper.operate;

import com.mini.pojo.entity.operate.BmIdea;
import com.mini.pojo.model.dto.operate.BmIdeaDTO;
import com.mini.pojo.model.edit.operate.BmIdeaEdit;
import com.mini.pojo.model.request.operate.BmIdeaRequest;
import com.mini.pojo.model.vo.operate.BmIdeaVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmIdeaStructMapper {

    BmIdeaStructMapper INSTANCE = Mappers.getMapper(BmIdeaStructMapper.class);

    /**
     * dto2entity
     */
    BmIdea dto2Entity(BmIdeaDTO dto);

    /**
     * entity2dto
     */
    BmIdeaDTO entity2Dto(BmIdea entity);

    /**
     * dto2vo
     */
    BmIdeaVo dto2Vo(BmIdeaDTO dto);

    /**
     * req2dto
     */
    BmIdeaDTO req2Dto(BmIdeaRequest request);

    /**
     * edit2dto
     */
    BmIdeaDTO edit2Dto(BmIdeaEdit edit);
}
