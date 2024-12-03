package com.mini.pojo.mapper.edu;

import com.mini.pojo.entity.edu.BmTutorApply;
import com.mini.pojo.model.dto.edu.BmTutorApplyDTO;
import com.mini.pojo.model.edit.edu.BmTutorApplyEdit;
import com.mini.pojo.model.request.edu.BmTutorApplyRequest;
import com.mini.pojo.model.vo.edu.BmTutorApplyVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmTutorApplyStructMapper {

    BmTutorApplyStructMapper INSTANCE = Mappers.getMapper(BmTutorApplyStructMapper.class);

    /**
     * dto2entity
     */
    BmTutorApply dto2Entity(BmTutorApplyDTO dto);

    /**
     * entity2dto
     */
    BmTutorApplyDTO entity2Dto(BmTutorApply entity);

    /**
     * dto2vo
     */
    BmTutorApplyVo dto2Vo(BmTutorApplyDTO dto);

    /**
     * req2dto
     */
    BmTutorApplyDTO req2Dto(BmTutorApplyRequest request);

    /**
     * edit2dto
     */
    BmTutorApplyDTO edit2Dto(BmTutorApplyEdit edit);
}
