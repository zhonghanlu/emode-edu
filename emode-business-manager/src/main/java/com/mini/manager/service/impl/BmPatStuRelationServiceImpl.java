package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.manager.mapper.BmPatStuRelationMapper;
import com.mini.manager.service.BmPatStuRelationService;
import com.mini.pojo.entity.org.BmPatStuRelation;
import com.mini.pojo.mapper.org.BmPatStuRelationStructMapper;
import com.mini.pojo.model.dto.org.BmPatStuRelationDTO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
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

    @Override
    public void delByStuId(long stuId) {
        LambdaQueryWrapper<BmPatStuRelation> wrapper = Wrappers.lambdaQuery(BmPatStuRelation.class);
        wrapper.eq(BmPatStuRelation::getStudentId, stuId)
                .eq(BmPatStuRelation::getDelFlag, Delete.NO);
        List<BmPatStuRelation> bmPatStuRelationList = bmPatStuRelationMapper.selectList(wrapper);

        if (CollectionUtils.isNotEmpty(bmPatStuRelationList)) {
            bmPatStuRelationList.forEach(item -> item.setDelFlag(Delete.YES));

            boolean b = updateBatchById(bmPatStuRelationList);
            if (!b) {
                throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
            }
        }
    }

    @Override
    public List<BmPatStuRelationDTO> getInfoByPatId(long id) {
        LambdaQueryWrapper<BmPatStuRelation> wrapper = Wrappers.lambdaQuery(BmPatStuRelation.class);
        wrapper.eq(BmPatStuRelation::getPatriarchId, id)
                .eq(BmPatStuRelation::getDelFlag, Delete.NO);
        List<BmPatStuRelation> bmPatStuRelationList = bmPatStuRelationMapper.selectList(wrapper);
        return BmPatStuRelationStructMapper.INSTANCE.entityList2DtoList(bmPatStuRelationList);
    }
}
