package com.mini.biz.manager.org;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.file.model.dto.SysFileDTO;
import com.mini.file.service.ISysFileService;
import com.mini.manager.service.BmPatStuRelationService;
import com.mini.manager.service.BmPatriarchService;
import com.mini.pojo.entity.org.BmPatriarch;
import com.mini.pojo.mapper.org.BmPatriarchStructMapper;
import com.mini.pojo.model.dto.org.BmPatStuRelationDTO;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.edit.org.BmPatriarchEdit;
import com.mini.pojo.model.query.org.BmPatriarchQuery;
import com.mini.pojo.model.request.org.BmPatriarchRequest;
import com.mini.pojo.model.vo.org.BmPatRelationStuVo;
import com.mini.pojo.model.vo.org.BmPatriarchPullVo;
import com.mini.pojo.model.vo.org.BmPatriarchVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**
 * @author zhl
 * @create 2024/11/12 17:18
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmPatriarchBiz {

    private final BmPatriarchService bmPatriarchService;

    private final BmPatStuRelationService bmPatStuRelationService;

    private final ISysFileService sysFileService;

    private static final String LIMIT_FIVE = "LIMIT 5";

    /**
     * 分页
     */
    public IPage<BmPatriarchVo> page(BmPatriarchQuery query) {
        IPage<BmPatriarchDTO> page = bmPatriarchService.page(query);
        return page.convert(BmPatriarchStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取家长详情
     */
    public BmPatriarchVo getEntityById(Long id) {
        BmPatriarchDTO bmPatriarchDTO = bmPatriarchService.selectById(id);

        if (Objects.isNull(bmPatriarchDTO)) {
            return null;
        }

        SysFileDTO sysFileDTO = sysFileService.getById(bmPatriarchDTO.getPatAvatarId());

        if (Objects.nonNull(sysFileDTO)) {
            bmPatriarchDTO.setPatAvatarUrl(sysFileDTO.getFileUrl());
        }

        return BmPatriarchStructMapper.INSTANCE.dto2Vo(bmPatriarchDTO);
    }

    /**
     * 新增家长信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmPatriarchRequest request) {
        // 1.新增家长信息
        bmPatriarchService.add(BmPatriarchStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        // 1.校验是否与学生进行关联，有关联不允许删除
        List<BmPatStuRelationDTO> bmPatStuRelationDTOList = bmPatStuRelationService.getInfoByPatId(id);
        if (CollectionUtils.isNotEmpty(bmPatStuRelationDTOList)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "此家长与孩子关联，不允许删除");
        }
        bmPatriarchService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmPatriarchEdit edit) {
        bmPatriarchService.update(BmPatriarchStructMapper.INSTANCE.edit2Dto(edit));
    }

    /**
     * 家长信息下拉列表，默认展示 5 条随机，根据名字详细搜索
     */
    public List<BmPatriarchPullVo> infoPull(String patName) {
        LambdaQueryWrapper<BmPatriarch> wrapper = Wrappers.lambdaQuery(BmPatriarch.class);
        wrapper.like(StringUtils.isNotBlank(patName), BmPatriarch::getPatName, patName)
                .last(LIMIT_FIVE);
        List<BmPatriarch> patriarchList = bmPatriarchService.list(wrapper);

        List<BmPatriarchDTO> bmPatriarchDTOList = BmPatriarchStructMapper.INSTANCE.entityList2DtoList(patriarchList);

        if (CollectionUtils.isNotEmpty(bmPatriarchDTOList)) {
            bmPatriarchDTOList.forEach(item -> {
                if (Objects.nonNull(item.getPatAvatarId())) {
                    SysFileDTO fileDTO = sysFileService.getById(item.getPatAvatarId());
                    if (Objects.nonNull(fileDTO)) {
                        item.setPatAvatarUrl(fileDTO.getFileUrl());
                    }
                }
            });
        }
        return BmPatriarchStructMapper.INSTANCE.voList2PullVoList(patriarchList);
    }

    /**
     * 家长关联孩子信息
     */
    public BmPatRelationStuVo detailRelationStu(Long id) {
        return bmPatriarchService.detailRelationStu(id);
    }
}
