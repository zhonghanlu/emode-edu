package com.mini.pojo.mapper.course;

import com.mini.pojo.entity.course.BmCourseSchedule;
import com.mini.pojo.model.dto.course.BmCourseScheduleDTO;
import com.mini.pojo.model.dto.course.BmCourseScheduleDetailDTO;
import com.mini.pojo.model.edit.course.BmCourseScheduleEdit;
import com.mini.pojo.model.request.course.BmCourseScheduleRequest;
import com.mini.pojo.model.vo.course.BmCourseScheduleDetailVo;
import com.mini.pojo.model.vo.course.BmCourseScheduleVo;
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

    /**
     * detailDto2DetailVo
     */
    BmCourseScheduleDetailVo detailDto2DetailVo(BmCourseScheduleDetailDTO bmCourseScheduleDetailDTO);
}
