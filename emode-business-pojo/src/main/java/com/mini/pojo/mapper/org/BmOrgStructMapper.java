package com.mini.pojo.mapper.org;

import com.mini.pojo.entity.org.BmOrg;
import com.mini.pojo.model.dto.org.BmOrgDTO;
import com.mini.pojo.model.edit.org.BmOrgEdit;
import com.mini.pojo.model.request.org.BmOrgRequest;
import com.mini.pojo.model.vo.org.BmOrgVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmOrgStructMapper {

    BmOrgStructMapper INSTANCE = Mappers.getMapper(BmOrgStructMapper.class);

    /**
     * dto2entity
     */
    BmOrg dto2Entity(BmOrgDTO dto);

    /**
     * entity2dto
     */
    BmOrgDTO entity2Dto(BmOrg entity);

    /**
     * dto2vo
     */
    BmOrgVo dto2Vo(BmOrgDTO dto);

    /**
     * req2dto
     */
    BmOrgDTO req2Dto(BmOrgRequest request);

    /**
     * edit2dto
     */
    BmOrgDTO edit2Dto(BmOrgEdit edit);
}
