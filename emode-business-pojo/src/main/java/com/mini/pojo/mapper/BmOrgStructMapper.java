package com.mini.pojo.mapper;

import com.mini.pojo.entity.manager.BmOrg;
import com.mini.pojo.model.dto.BmOrgDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmOrgStructMapper {

    BmOrgStructMapper INSTANCE = Mappers.getMapper(BmOrgStructMapper.class);

    BmOrg dto2Entity(BmOrgDTO dto);
}
