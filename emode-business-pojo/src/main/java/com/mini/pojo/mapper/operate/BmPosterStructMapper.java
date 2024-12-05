package com.mini.pojo.mapper.operate;

import com.mini.pojo.entity.operate.BmPoster;
import com.mini.pojo.model.dto.operate.BmPosterDTO;
import com.mini.pojo.model.edit.operate.BmPosterEdit;
import com.mini.pojo.model.request.operate.BmPosterRequest;
import com.mini.pojo.model.vo.operate.BmPosterVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmPosterStructMapper {

    BmPosterStructMapper INSTANCE = Mappers.getMapper(BmPosterStructMapper.class);

    /**
     * dto2entity
     */
    BmPoster dto2Entity(BmPosterDTO dto);

    /**
     * entity2dto
     */
    BmPosterDTO entity2Dto(BmPoster entity);

    /**
     * dto2vo
     */
    BmPosterVo dto2Vo(BmPosterDTO dto);

    /**
     * req2dto
     */
    BmPosterDTO req2Dto(BmPosterRequest request);

    /**
     * edit2dto
     */
    BmPosterDTO edit2Dto(BmPosterEdit edit);
}
