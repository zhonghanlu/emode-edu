package com.mini.base.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.base.entity.SysNotice;
import com.mini.base.entity.SysUserNotice;
import com.mini.base.mapper.SysNoticeMapper;
import com.mini.base.mapper.SysUserNoticeMapper;
import com.mini.base.mapperstruct.SysNoticeStructMapper;
import com.mini.base.model.dto.SysNoticeDTO;
import com.mini.base.model.query.SysNoticeQuery;
import com.mini.base.service.ISysNoticeService;
import com.mini.common.constant.LastSql;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.MessageStatus;
import com.mini.common.enums.str.NoticeType;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author zhl
 * @create 2024/8/6 16:19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SysNoticeServiceImpl implements ISysNoticeService {

    private final SysNoticeMapper sysNoticeMapper;

    private final SysUserNoticeMapper sysUserNoticeMapper;

    @Override
    public IPage<SysNoticeDTO> selectPage(SysNoticeQuery query) {
        return sysNoticeMapper.selectPage(query, query.build());
    }

    @Override
    public SysNoticeDTO selectLastBroadcastNotice() {
        LambdaQueryWrapper<SysNotice> wrapper = Wrappers.lambdaQuery(SysNotice.class);

        wrapper.eq(SysNotice::getNoticeType, NoticeType.LOCAL)
                .eq(SysNotice::getMessageStatus, MessageStatus.BROADCAST)
                .eq(SysNotice::getDelFlag, Delete.NO)
                .orderByDesc(SysNotice::getSendTime)
                .last(LastSql.LIMIT_ONE);
        return SysNoticeStructMapper.INSTANCE.entity2Dto(sysNoticeMapper.selectOne(wrapper));
    }

    @Override
    public SysNoticeDTO selectById(Long noticeId) {

        SysNotice sysNotice = CommonMybatisUtil.getById(noticeId, sysNoticeMapper);

        if (Objects.isNull(sysNotice)) {
            return null;
        }

        // 独立发送单独处理
        if (sysNotice.getMessageStatus().equals(MessageStatus.ALONE)) {
            LambdaQueryWrapper<SysUserNotice> wrapper = Wrappers.lambdaQuery(SysUserNotice.class);
            wrapper.eq(SysUserNotice::getNoticeId, noticeId)
                    .eq(SysUserNotice::getDelFlag, Delete.NO);
            List<SysUserNotice> sysUserNoticeList = sysUserNoticeMapper.selectList(wrapper);
            if (CollectionUtils.isNotEmpty(sysUserNoticeList)) {
                List<Long> userIdList = sysUserNoticeList.stream().map(SysUserNotice::getUserId).collect(Collectors.toList());
                SysNoticeDTO sysNoticeDTO = SysNoticeStructMapper.INSTANCE.entity2Dto(sysNotice);
                sysNoticeDTO.setReceiveIdList(userIdList);
                return sysNoticeDTO;
            }
        }

        return SysNoticeStructMapper.INSTANCE.entity2Dto(sysNotice);
    }
}
