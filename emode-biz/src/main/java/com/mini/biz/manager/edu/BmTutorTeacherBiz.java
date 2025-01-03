package com.mini.biz.manager.edu;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmTutorTeacherService;
import com.mini.pojo.mapper.edu.BmTutorTeacherStructMapper;
import com.mini.pojo.model.dto.edu.BmTutorTeacherDTO;
import com.mini.pojo.model.edit.edu.BmTutorTeacherEdit;
import com.mini.pojo.model.query.edu.BmTutorTeacherQuery;
import com.mini.pojo.model.request.edu.BmTutorTeacherRequest;
import com.mini.pojo.model.vo.edu.BmTutorTeacherVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024年12月5日13:45:43
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmTutorTeacherBiz {

    private final BmTutorTeacherService bmTutorTeacherService;

    /**
     * 分页
     */
    public IPage<BmTutorTeacherVo> page(BmTutorTeacherQuery query) {
        IPage<BmTutorTeacherDTO> page = bmTutorTeacherService.page(query);
        return page.convert(BmTutorTeacherStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条家教老师详情
     */
    public BmTutorTeacherVo getEntityById(Long id) {
        BmTutorTeacherDTO bmTutorTeacherDTO = bmTutorTeacherService.selectById(id);
        return BmTutorTeacherStructMapper.INSTANCE.dto2Vo(bmTutorTeacherDTO);
    }

    /**
     * 新增家教老师信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmTutorTeacherRequest request) {
        bmTutorTeacherService.add(BmTutorTeacherStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmTutorTeacherService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmTutorTeacherEdit edit) {
        bmTutorTeacherService.update(BmTutorTeacherStructMapper.INSTANCE.edit2Dto(edit));
    }

}
