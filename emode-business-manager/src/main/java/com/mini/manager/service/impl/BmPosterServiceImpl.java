package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.YesOrNo;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmPosterMapper;
import com.mini.manager.service.BmPosterService;
import com.mini.pojo.entity.operate.BmPoster;
import com.mini.pojo.mapper.operate.BmPosterStructMapper;
import com.mini.pojo.model.dto.operate.BmPosterDTO;
import com.mini.pojo.model.query.operate.BmPosterQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 海报统一管理表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-05
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmPosterServiceImpl extends ServiceImpl<BmPosterMapper, BmPoster> implements BmPosterService {

    private final BmPosterMapper bmPosterMapper;

    @Override
    public void add(BmPosterDTO dto) {
        BmPoster bmPoster = BmPosterStructMapper.INSTANCE.dto2Entity(dto);

        if (Objects.isNull(bmPoster.getPosterStatus())) {
            bmPoster.setPosterStatus(YesOrNo.NO);
        }

        bmPoster.setId(IDGenerator.next());
        bmPoster.setDelFlag(Delete.NO);

        int b2 = bmPosterMapper.insert(bmPoster);

        if (b2 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmPoster bmPoster = CommonMybatisUtil.getById(id, bmPosterMapper);

        if (Objects.isNull(bmPoster)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmPoster.setDelFlag(Delete.YES);
        int b = bmPosterMapper.updateById(bmPoster);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmPosterDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmPosterMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmPoster bmPoster = BmPosterStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmPosterMapper.updateById(bmPoster);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmPosterDTO selectById(long id) {
        return BmPosterStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmPosterMapper));
    }

    @Override
    public IPage<BmPosterDTO> page(BmPosterQuery query) {
        return bmPosterMapper.page(query, query.build());
    }
}
