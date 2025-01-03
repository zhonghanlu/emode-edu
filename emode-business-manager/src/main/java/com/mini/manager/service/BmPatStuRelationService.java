package com.mini.manager.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mini.pojo.entity.org.BmPatStuRelation;
import com.mini.pojo.model.dto.org.BmPatStuRelationDTO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 家长和学生关联信息表 服务类
 * </p>
 *
 * @author zhl
 * @since 2024-12-10
 */
public interface BmPatStuRelationService extends IService<BmPatStuRelation> {

    Map<Long, BmPatStuRelationDTO> selectByStuIdListForMap(List<Long> stuIdList);
}
