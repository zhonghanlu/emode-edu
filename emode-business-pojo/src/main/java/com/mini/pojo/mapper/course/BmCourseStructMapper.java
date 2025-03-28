package com.mini.pojo.mapper.course;

import com.mini.pojo.entity.course.BmCourse;
import com.mini.pojo.model.dto.course.BmCourseDTO;
import com.mini.pojo.model.dto.course.BmCourseDetailDTO;
import com.mini.pojo.model.edit.course.BmCourseEdit;
import com.mini.pojo.model.request.course.BmCourseRequest;
import com.mini.pojo.model.vo.course.BmCourseDetailVo;
import com.mini.pojo.model.vo.course.BmCourseVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmCourseStructMapper {

    BmCourseStructMapper INSTANCE = Mappers.getMapper(BmCourseStructMapper.class);

    /**
     * dto2entity
     */
    BmCourse dto2Entity(BmCourseDTO dto);

    /**
     * entity2dto
     */
    BmCourseDTO entity2Dto(BmCourse entity);

    /**
     * dto2vo
     */
    BmCourseVo dto2Vo(BmCourseDTO dto);

    /**
     * req2dto
     */
    BmCourseDTO req2Dto(BmCourseRequest request);

    /**
     * edit2dto
     */
    BmCourseDTO edit2Dto(BmCourseEdit edit);

    /**
     * reqList2dtoList
     */
    List<BmCourseDTO> reqList2DtoList(List<BmCourseRequest> reqList);

    /**
     * dtoList2entityList
     */
    List<BmCourse> dtoList2EntityList(List<BmCourseDTO> dtoList);

    /**
     * detailDto2detailVo
     */
    List<BmCourseDetailVo> detailDTO2DetailVo(List<BmCourseDetailDTO> bmCourseDetailDTOList);
}
