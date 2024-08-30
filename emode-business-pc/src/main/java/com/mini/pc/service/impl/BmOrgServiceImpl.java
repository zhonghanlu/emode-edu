package com.mini.pc.service.impl;

import com.mini.pc.mapper.BmOrgMapper;
import com.mini.pc.service.BmOrgService;
import com.mini.pojo.model.dto.BmOrgDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author zhl
 * @create 2024/8/30 15:46
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmOrgServiceImpl implements BmOrgService {

    private final BmOrgMapper bmOrgMapper;

    @Override
    public void add(BmOrgDTO dto) {

    }

    @Override
    public void del(long id) {
        // 2500 k + m
        // 500 UI
        // 4000 + 4000 c + c
        // 130 n

        // 1k
    }

    @Override
    public void update(BmOrgDTO dto) {

    }

    @Override
    public BmOrgDTO selectById(long id) {
        return null;
    }
}
