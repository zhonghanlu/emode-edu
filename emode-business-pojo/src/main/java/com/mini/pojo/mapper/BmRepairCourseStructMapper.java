package com.mini.pojo.mapper;

import com.mini.pojo.entity.manager.BmRepairCourse;
import com.mini.pojo.model.dto.BmRepairCourseDTO;
import com.mini.pojo.model.edit.BmRepairCourseEdit;
import com.mini.pojo.model.request.BmRepairCourseRequest;
import com.mini.pojo.model.vo.BmRepairCourseVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmRepairCourseStructMapper {

    BmRepairCourseStructMapper INSTANCE = Mappers.getMapper(BmRepairCourseStructMapper.class);

    /**
     * dto2entity
     */
    BmRepairCourse dto2Entity(BmRepairCourseDTO dto);

    /**
     * entity2dto
     */
    BmRepairCourseDTO entity2Dto(BmRepairCourse entity);

    /**
     * dto2vo
     */
    BmRepairCourseVo dto2Vo(BmRepairCourseDTO dto);

    /**
     * req2dto
     */
    BmRepairCourseDTO req2Dto(BmRepairCourseRequest request);

    /**
     * edit2dto
     */
    BmRepairCourseDTO edit2Dto(BmRepairCourseEdit edit);
}
