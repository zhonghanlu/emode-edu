package com.mini.biz.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmStudentService;
import com.mini.pojo.mapper.BmStudentStructMapper;
import com.mini.pojo.model.dto.BmStudentDTO;
import com.mini.pojo.model.edit.BmStudentEdit;
import com.mini.pojo.model.query.BmStudentQuery;
import com.mini.pojo.model.request.BmStudentRequest;
import com.mini.pojo.model.vo.BmStudentVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024/11/12 17:18
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmStudentBiz {

    private final BmStudentService bmStudentService;

    /**
     * 分页
     */
    public IPage<BmStudentVo> page(BmStudentQuery query) {
        IPage<BmStudentDTO> page = bmStudentService.page(query);
        return page.convert(BmStudentStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmStudentVo getEntityById(Long id) {
        BmStudentDTO bmStudentDTO = bmStudentService.selectById(id);
        return BmStudentStructMapper.INSTANCE.dto2Vo(bmStudentDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmStudentRequest request) {
        bmStudentService.add(BmStudentStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmStudentService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmStudentEdit edit) {
        bmStudentService.update(BmStudentStructMapper.INSTANCE.edit2Dto(edit));
    }
}
