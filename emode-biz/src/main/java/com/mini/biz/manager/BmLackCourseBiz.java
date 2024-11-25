package com.mini.biz.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmLackCourseService;
import com.mini.pojo.mapper.BmLackCourseStructMapper;
import com.mini.pojo.model.dto.course.BmLackCourseDTO;
import com.mini.pojo.model.edit.course.BmLackCourseEdit;
import com.mini.pojo.model.query.course.BmLackCourseQuery;
import com.mini.pojo.model.request.course.BmLackCourseRequest;
import com.mini.pojo.model.vo.course.BmLackCourseVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024/11/20 13:47
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmLackCourseBiz {

    private final BmLackCourseService bmLackCourseService;

    /**
     * 分页
     */
    public IPage<BmLackCourseVo> page(BmLackCourseQuery query) {
        IPage<BmLackCourseDTO> page = bmLackCourseService.page(query);
        return page.convert(BmLackCourseStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmLackCourseVo getEntityById(Long id) {
        BmLackCourseDTO bmLackCourseDTO = bmLackCourseService.selectById(id);
        return BmLackCourseStructMapper.INSTANCE.dto2Vo(bmLackCourseDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmLackCourseRequest request) {
        bmLackCourseService.add(BmLackCourseStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmLackCourseService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmLackCourseEdit edit) {
        bmLackCourseService.update(BmLackCourseStructMapper.INSTANCE.edit2Dto(edit));
    }
}
