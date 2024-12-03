package com.mini.biz.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmCourseScheduleService;
import com.mini.pojo.mapper.course.BmCourseScheduleStructMapper;
import com.mini.pojo.model.dto.course.BmCourseScheduleDTO;
import com.mini.pojo.model.edit.course.BmCourseScheduleEdit;
import com.mini.pojo.model.query.course.BmCourseScheduleQuery;
import com.mini.pojo.model.request.course.BmCourseScheduleRequest;
import com.mini.pojo.model.vo.course.BmCourseScheduleVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024/11/20 13:42
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmCourseScheduleBiz {

    private final BmCourseScheduleService bmCourseScheduleService;

    /**
     * 分页
     */
    public IPage<BmCourseScheduleVo> page(BmCourseScheduleQuery query) {
        IPage<BmCourseScheduleDTO> page = bmCourseScheduleService.page(query);
        return page.convert(BmCourseScheduleStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmCourseScheduleVo getEntityById(Long id) {
        BmCourseScheduleDTO bmCourseScheduleDTO = bmCourseScheduleService.selectById(id);
        return BmCourseScheduleStructMapper.INSTANCE.dto2Vo(bmCourseScheduleDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmCourseScheduleRequest request) {
        bmCourseScheduleService.add(BmCourseScheduleStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmCourseScheduleService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmCourseScheduleEdit edit) {
        bmCourseScheduleService.update(BmCourseScheduleStructMapper.INSTANCE.edit2Dto(edit));
    }
}
