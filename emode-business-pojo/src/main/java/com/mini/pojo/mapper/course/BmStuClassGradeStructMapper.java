package com.mini.pojo.mapper.course;

import com.mini.pojo.entity.course.BmStuClassGrade;
import com.mini.pojo.model.vo.course.BmStuAlreadyVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @author zhl
 * @create 2025/2/14 14:44
 */
@Mapper
public interface BmStuClassGradeStructMapper {

    BmStuClassGradeStructMapper INSTANCE = Mappers.getMapper(BmStuClassGradeStructMapper.class);

    /**
     * entityList2VoList
     */
    List<BmStuAlreadyVo> entityList2VoList(List<BmStuClassGrade> bmStuClassGradeList);
}
