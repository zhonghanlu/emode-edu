package com.mini.pojo.mapper;

import com.mini.pojo.entity.manager.BmCourseSchedule;
import com.mini.pojo.model.dto.BmCourseScheduleDTO;
import com.mini.pojo.model.edit.BmCourseScheduleEdit;
import com.mini.pojo.model.request.BmCourseScheduleRequest;
import com.mini.pojo.model.vo.BmCourseScheduleVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmCourseScheduleStructMapper {

    BmCourseScheduleStructMapper INSTANCE = Mappers.getMapper(BmCourseScheduleStructMapper.class);

    /**
     * dto2entity
     */
    BmCourseSchedule dto2Entity(BmCourseScheduleDTO dto);

    /**
     * entity2dto
     */
    BmCourseScheduleDTO entity2Dto(BmCourseSchedule entity);

    /**
     * dto2vo
     */
    BmCourseScheduleVo dto2Vo(BmCourseScheduleDTO dto);

    /**
     * req2dto
     */
    BmCourseScheduleDTO req2Dto(BmCourseScheduleRequest request);

    /**
     * edit2dto
     */
    BmCourseScheduleDTO edit2Dto(BmCourseScheduleEdit edit);
}
