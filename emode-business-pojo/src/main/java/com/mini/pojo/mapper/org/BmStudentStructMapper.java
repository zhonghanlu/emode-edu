package com.mini.pojo.mapper.org;

import com.mini.pojo.entity.org.BmStudent;
import com.mini.pojo.model.dto.org.BmStudentDTO;
import com.mini.pojo.model.edit.org.BmStudentEdit;
import com.mini.pojo.model.request.business.BmPatAddStuRequest;
import com.mini.pojo.model.request.org.BmStudentRequest;
import com.mini.pojo.model.vo.org.BmStudentVo;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmStudentStructMapper {

    BmStudentStructMapper INSTANCE = Mappers.getMapper(BmStudentStructMapper.class);

    /**
     * dto2entity
     */
    BmStudent dto2Entity(BmStudentDTO dto);

    /**
     * entity2dto
     */
    BmStudentDTO entity2Dto(BmStudent entity);

    /**
     * dto2vo
     */
    @Mapping(source = "bmStuClassHourDataDTOList", target = "bmStuClassHourDataVoList")
    BmStudentVo dto2Vo(BmStudentDTO dto);

    /**
     * req2dto
     */
    BmStudentDTO req2Dto(BmStudentRequest request);

    /**
     * edit2dto
     */
    BmStudentDTO edit2Dto(BmStudentEdit edit);

    /**
     * 家长添加学生信息 转换为学生信息
     */
    BmStudentDTO reqRelation2Dto(BmPatAddStuRequest request);
}
