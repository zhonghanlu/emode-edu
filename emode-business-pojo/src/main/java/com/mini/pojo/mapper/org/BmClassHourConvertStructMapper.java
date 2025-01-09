package com.mini.pojo.mapper.org;

import com.mini.pojo.entity.org.BmClassHourConvert;
import com.mini.pojo.model.vo.org.BmClassHourConvertVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmClassHourConvertStructMapper {

    BmClassHourConvertStructMapper INSTANCE = Mappers.getMapper(BmClassHourConvertStructMapper.class);

    /**
     * entityList2VoList
     */
    List<BmClassHourConvertVo> entityList2VoList(List<BmClassHourConvert> entityList);
}
