package com.mini.pojo.mapper;

import com.mini.pojo.entity.manager.BmTeacher;
import com.mini.pojo.model.dto.BmTeacherDTO;
import com.mini.pojo.model.edit.BmTeacherEdit;
import com.mini.pojo.model.request.BmTeacherRequest;
import com.mini.pojo.model.vo.BmTeacherVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmTeacherStructMapper {

    BmTeacherStructMapper INSTANCE = Mappers.getMapper(BmTeacherStructMapper.class);

    /**
     * dto2entity
     */
    BmTeacher dto2Entity(BmTeacherDTO dto);

    /**
     * entity2dto
     */
    BmTeacherDTO entity2Dto(BmTeacher entity);

    /**
     * dto2vo
     */
    BmTeacherVo dto2Vo(BmTeacherDTO dto);

    /**
     * req2dto
     */
    BmTeacherDTO req2Dto(BmTeacherRequest request);

    /**
     * edit2dto
     */
    BmTeacherDTO edit2Dto(BmTeacherEdit edit);
}
