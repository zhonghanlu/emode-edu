package com.mini.pojo.mapper;

import com.mini.pojo.entity.manager.BmCourseScheduleItem;
import com.mini.pojo.model.dto.BmCourseScheduleItemDTO;
import com.mini.pojo.model.edit.BmCourseScheduleItemEdit;
import com.mini.pojo.model.request.BmCourseScheduleItemRequest;
import com.mini.pojo.model.vo.BmCourseScheduleItemVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmCourseScheduleItemStructMapper {

    BmCourseScheduleItemStructMapper INSTANCE = Mappers.getMapper(BmCourseScheduleItemStructMapper.class);

    /**
     * dto2entity
     */
    BmCourseScheduleItem dto2Entity(BmCourseScheduleItemDTO dto);

    /**
     * entity2dto
     */
    BmCourseScheduleItemDTO entity2Dto(BmCourseScheduleItem entity);

    /**
     * dto2vo
     */
    BmCourseScheduleItemVo dto2Vo(BmCourseScheduleItemDTO dto);

    /**
     * req2dto
     */
    BmCourseScheduleItemDTO req2Dto(BmCourseScheduleItemRequest request);

    /**
     * edit2dto
     */
    BmCourseScheduleItemDTO edit2Dto(BmCourseScheduleItemEdit edit);
}
