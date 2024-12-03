package com.mini.biz.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmRepairCourseService;
import com.mini.pojo.mapper.course.BmRepairCourseStructMapper;
import com.mini.pojo.model.dto.course.BmRepairCourseDTO;
import com.mini.pojo.model.edit.course.BmRepairCourseEdit;
import com.mini.pojo.model.query.course.BmRepairCourseQuery;
import com.mini.pojo.model.request.course.BmRepairCourseRequest;
import com.mini.pojo.model.vo.course.BmRepairCourseVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024/11/20 14:22
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmRepairCourseBiz {

    private final BmRepairCourseService bmRepairCourseService;

    /**
     * 分页
     */
    public IPage<BmRepairCourseVo> page(BmRepairCourseQuery query) {
        IPage<BmRepairCourseDTO> page = bmRepairCourseService.page(query);
        return page.convert(BmRepairCourseStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmRepairCourseVo getEntityById(Long id) {
        BmRepairCourseDTO bmRepairCourseDTO = bmRepairCourseService.selectById(id);
        return BmRepairCourseStructMapper.INSTANCE.dto2Vo(bmRepairCourseDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmRepairCourseRequest request) {
        bmRepairCourseService.add(BmRepairCourseStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmRepairCourseService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmRepairCourseEdit edit) {
        bmRepairCourseService.update(BmRepairCourseStructMapper.INSTANCE.edit2Dto(edit));
    }
}
