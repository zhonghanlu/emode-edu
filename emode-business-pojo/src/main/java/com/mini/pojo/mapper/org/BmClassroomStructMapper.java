package com.mini.pojo.mapper.org;

import com.mini.pojo.entity.org.BmClassroom;
import com.mini.pojo.model.dto.org.BmClassroomDTO;
import com.mini.pojo.model.edit.org.BmClassroomEdit;
import com.mini.pojo.model.request.org.BmClassroomRequest;
import com.mini.pojo.model.vo.org.BmClassroomVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmClassroomStructMapper {

    BmClassroomStructMapper INSTANCE = Mappers.getMapper(BmClassroomStructMapper.class);

    /**
     * dto2entity
     */
    BmClassroom dto2Entity(BmClassroomDTO dto);

    /**
     * entity2dto
     */
    BmClassroomDTO entity2Dto(BmClassroom entity);

    /**
     * dto2vo
     */
    BmClassroomVo dto2Vo(BmClassroomDTO dto);

    /**
     * req2dto
     */
    BmClassroomDTO req2Dto(BmClassroomRequest request);

    /**
     * edit2dto
     */
    BmClassroomDTO edit2Dto(BmClassroomEdit edit);
}
