package com.mini.pojo.mapper.org;

import com.mini.pojo.entity.org.BmPatriarch;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.edit.org.BmPatriarchEdit;
import com.mini.pojo.model.request.org.BmPatriarchRequest;
import com.mini.pojo.model.vo.org.BmPatriarchPullVo;
import com.mini.pojo.model.vo.org.BmPatriarchVo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @author zhl
 * @create 2024/8/30 15:48
 */
@Mapper
public interface BmPatriarchStructMapper {

    BmPatriarchStructMapper INSTANCE = Mappers.getMapper(BmPatriarchStructMapper.class);

    /**
     * dto2entity
     */
    BmPatriarch dto2Entity(BmPatriarchDTO dto);

    /**
     * entity2dto
     */
    BmPatriarchDTO entity2Dto(BmPatriarch entity);

    /**
     * dto2vo
     */
    BmPatriarchVo dto2Vo(BmPatriarchDTO dto);

    /**
     * req2dto
     */
    BmPatriarchDTO req2Dto(BmPatriarchRequest request);

    /**
     * edit2dto
     */
    BmPatriarchDTO edit2Dto(BmPatriarchEdit edit);

    /**
     * voList2pullVoList
     */
    List<BmPatriarchPullVo> voList2PullVoList(List<BmPatriarch> patriarchList);
}
