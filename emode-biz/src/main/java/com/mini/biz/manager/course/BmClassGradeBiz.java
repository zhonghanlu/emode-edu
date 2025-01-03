package com.mini.biz.manager.course;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.manager.service.BmClassGradeService;
import com.mini.pojo.mapper.course.BmClassGradeStructMapper;
import com.mini.pojo.model.dto.course.BmClassGradeDTO;
import com.mini.pojo.model.edit.course.BmClassGradeEdit;
import com.mini.pojo.model.query.course.BmClassGradeQuery;
import com.mini.pojo.model.request.course.BmClassGradeRequest;
import com.mini.pojo.model.vo.course.BmClassGradeVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zhl
 * @create 2024/11/20 13:40
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmClassGradeBiz {

    private final BmClassGradeService bmClassGradeService;

    /**
     * 分页
     */
    public IPage<BmClassGradeVo> page(BmClassGradeQuery query) {
        IPage<BmClassGradeDTO> page = bmClassGradeService.page(query);
        return page.convert(BmClassGradeStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条班级详情
     */
    public BmClassGradeVo getEntityById(Long id) {
        BmClassGradeDTO bmClassGradeDTO = bmClassGradeService.selectById(id);
        return BmClassGradeStructMapper.INSTANCE.dto2Vo(bmClassGradeDTO);
    }

    /**
     * 新增班级信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmClassGradeRequest request) {
        bmClassGradeService.add(BmClassGradeStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmClassGradeService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmClassGradeEdit edit) {
        bmClassGradeService.update(BmClassGradeStructMapper.INSTANCE.edit2Dto(edit));
    }

}
