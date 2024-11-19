package com.mini.pojo.mapper;

import com.mini.pojo.entity.manager.BmLackCourse;
import com.mini.pojo.model.dto.BmLackCourseDTO;
import com.mini.pojo.model.edit.BmLackCourseEdit;
import com.mini.pojo.model.request.BmLackCourseRequest;
import com.mini.pojo.model.vo.BmLackCourseVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmLackCourseStructMapper {

    BmLackCourseStructMapper INSTANCE = Mappers.getMapper(BmLackCourseStructMapper.class);

    /**
     * dto2entity
     */
    BmLackCourse dto2Entity(BmLackCourseDTO dto);

    /**
     * entity2dto
     */
    BmLackCourseDTO entity2Dto(BmLackCourse entity);

    /**
     * dto2vo
     */
    BmLackCourseVo dto2Vo(BmLackCourseDTO dto);

    /**
     * req2dto
     */
    BmLackCourseDTO req2Dto(BmLackCourseRequest request);

    /**
     * edit2dto
     */
    BmLackCourseDTO edit2Dto(BmLackCourseEdit edit);
}
