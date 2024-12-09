package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmIdeaMapper;
import com.mini.manager.service.BmIdeaService;
import com.mini.pojo.entity.operate.BmIdea;
import com.mini.pojo.mapper.operate.BmIdeaStructMapper;
import com.mini.pojo.model.dto.operate.BmIdeaDTO;
import com.mini.pojo.model.query.operate.BmIdeaQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 意见箱表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmIdeaServiceImpl extends ServiceImpl<BmIdeaMapper, BmIdea> implements BmIdeaService {

    private final BmIdeaMapper bmIdeaMapper;

    @Override
    public void add(BmIdeaDTO dto) {
        BmIdea bmIdea = BmIdeaStructMapper.INSTANCE.dto2Entity(dto);

        bmIdea.setId(IDGenerator.next());
        bmIdea.setDelFlag(Delete.NO);

        int b2 = bmIdeaMapper.insert(bmIdea);

        if (b2 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmIdea bmIdea = CommonMybatisUtil.getById(id, bmIdeaMapper);

        if (Objects.isNull(bmIdea)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmIdea.setDelFlag(Delete.YES);
        int b = bmIdeaMapper.updateById(bmIdea);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmIdeaDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmIdeaMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmIdea bmIdea = BmIdeaStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmIdeaMapper.updateById(bmIdea);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmIdeaDTO selectById(long id) {
        return BmIdeaStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmIdeaMapper));
    }

    @Override
    public IPage<BmIdeaDTO> page(BmIdeaQuery query) {
        return bmIdeaMapper.page(query, query.build());
    }
}
