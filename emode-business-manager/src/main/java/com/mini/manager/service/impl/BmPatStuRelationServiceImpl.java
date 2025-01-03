package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.manager.mapper.BmPatStuRelationMapper;
import com.mini.manager.service.BmPatStuRelationService;
import com.mini.pojo.entity.org.BmPatStuRelation;
import com.mini.pojo.model.dto.org.BmPatStuRelationDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * <p>
 * 家长和学生关联信息表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-10
 */
@Service
@RequiredArgsConstructor
public class BmPatStuRelationServiceImpl extends ServiceImpl<BmPatStuRelationMapper, BmPatStuRelation> implements BmPatStuRelationService {

    private final BmPatStuRelationMapper bmPatStuRelationMapper;

    @Override
    public Map<Long, BmPatStuRelationDTO> selectByStuIdListForMap(List<Long> stuIdList) {
        List<BmPatStuRelationDTO> bmPatStuRelationDTOList = bmPatStuRelationMapper.selectByStuIdList(stuIdList);
        return bmPatStuRelationDTOList.stream()
                .collect(Collectors.toMap(BmPatStuRelationDTO::getStuId, Function.identity()));
    }
}
