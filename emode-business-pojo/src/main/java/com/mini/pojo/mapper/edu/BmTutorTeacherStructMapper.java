package com.mini.pojo.mapper.edu;

import com.mini.pojo.entity.edu.BmTutorTeacher;
import com.mini.pojo.model.dto.edu.BmTutorTeacherDTO;
import com.mini.pojo.model.edit.edu.BmTutorTeacherEdit;
import com.mini.pojo.model.request.edu.BmTutorTeacherRequest;
import com.mini.pojo.model.vo.edu.BmTutorTeacherVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmTutorTeacherStructMapper {

    BmTutorTeacherStructMapper INSTANCE = Mappers.getMapper(BmTutorTeacherStructMapper.class);

    /**
     * dto2entity
     */
    BmTutorTeacher dto2Entity(BmTutorTeacherDTO dto);

    /**
     * entity2dto
     */
    BmTutorTeacherDTO entity2Dto(BmTutorTeacher entity);

    /**
     * dto2vo
     */
    BmTutorTeacherVo dto2Vo(BmTutorTeacherDTO dto);

    /**
     * req2dto
     */
    BmTutorTeacherDTO req2Dto(BmTutorTeacherRequest request);

    /**
     * edit2dto
     */
    BmTutorTeacherDTO edit2Dto(BmTutorTeacherEdit edit);
}
