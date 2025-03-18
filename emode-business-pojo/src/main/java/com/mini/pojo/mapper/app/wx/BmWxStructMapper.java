package com.mini.pojo.mapper.app.wx;

import com.mini.pojo.entity.app.wx.BmWx;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.dto.wx.BmWxDTO;
import com.mini.pojo.model.request.wx.BmWxLoginRequest;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

/**
 * @Author : zhl
 * @Date: 2025/3/17 21:25
 * @Description:
 */
@Mapper
public interface BmWxStructMapper {

    BmWxStructMapper INSTANCE = Mappers.getMapper(BmWxStructMapper.class);

    /**
     * req2Entity
     */
    BmWx req2Entity(BmWxLoginRequest request);

    /**
     * patriarchReq2Dto
     */
    @Mapping(source = "request.phoneNumber", target = "patWx")
    @Mapping(source = "request.address", target = "patAddress")
    @Mapping(source = "request.phoneNumber", target = "patPhone")
    @Mapping(source = "request.avatarUrl", target = "patAvatarUrl")
    @Mapping(source = "request.avatarId", target = "patAvatarId")
    @Mapping(source = "request.wxName", target = "patName")
    BmPatriarchDTO patriarchReq2Dto(BmWxLoginRequest request);

    /**
     * req2Dto
     */
    BmWxDTO req2Dto(BmWxLoginRequest request);

    /**
     * entity2Dto
     */
    BmWxDTO entity2Dto(BmWx entity);

    /**
     * dto2Entity
     */
    BmWx dto2Entity(BmWxDTO bmWxDTO);
}
