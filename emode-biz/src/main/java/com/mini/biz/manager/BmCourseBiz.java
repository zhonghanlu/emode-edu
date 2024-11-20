package com.mini.biz.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmCourseService;
import com.mini.pojo.mapper.BmCourseStructMapper;
import com.mini.pojo.model.dto.BmCourseDTO;
import com.mini.pojo.model.edit.BmCourseEdit;
import com.mini.pojo.model.query.BmCourseQuery;
import com.mini.pojo.model.request.BmCourseRequest;
import com.mini.pojo.model.vo.BmCourseVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024/11/20 13:41
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmCourseBiz {


    private final BmCourseService bmCourseService;

    /**
     * 分页
     */
    public IPage<BmCourseVo> page(BmCourseQuery query) {
        IPage<BmCourseDTO> page = bmCourseService.page(query);
        return page.convert(BmCourseStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmCourseVo getEntityById(Long id) {
        BmCourseDTO bmCourseDTO = bmCourseService.selectById(id);
        return BmCourseStructMapper.INSTANCE.dto2Vo(bmCourseDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmCourseRequest request) {
        bmCourseService.add(BmCourseStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmCourseService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmCourseEdit edit) {
        bmCourseService.update(BmCourseStructMapper.INSTANCE.edit2Dto(edit));
    }
}
