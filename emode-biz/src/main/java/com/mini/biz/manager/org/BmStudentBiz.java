package com.mini.biz.manager.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.BmPatStuRelationService;
import com.mini.manager.service.BmPatriarchService;
import com.mini.manager.service.BmStudentService;
import com.mini.pojo.entity.org.BmPatStuRelation;
import com.mini.pojo.mapper.org.BmStudentStructMapper;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.dto.org.BmStudentDTO;
import com.mini.pojo.model.edit.org.BmStudentEdit;
import com.mini.pojo.model.query.org.BmStudentQuery;
import com.mini.pojo.model.request.org.BmStudentRequest;
import com.mini.pojo.model.vo.org.BmStudentVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

/**
 * @author zhl
 * @create 2024/11/12 17:18
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmStudentBiz {

    private final BmStudentService bmStudentService;

    private final BmPatriarchService bmPatriarchService;

    private final BmPatStuRelationService bmPatStuRelationService;

    /**
     * 分页
     */
    public IPage<BmStudentVo> page(BmStudentQuery query) {
        IPage<BmStudentDTO> page = bmStudentService.page(query);
        return page.convert(BmStudentStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取学生详情
     */
    public BmStudentVo getEntityById(Long id) {
        BmStudentDTO bmStudentDTO = bmStudentService.selectById(id);
        return BmStudentStructMapper.INSTANCE.dto2Vo(bmStudentDTO);
    }

    /**
     * 新增学生信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmStudentRequest request) {
        // 校验家长信息是否存在
        BmPatriarchDTO bmPatriarchDTO = bmPatriarchService.selectById(request.getPatriarchId());

        if (Objects.isNull(bmPatriarchDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前家长信息不存在");
        }

        // 新增学生信息
        BmStudentDTO bmStudentDTO = bmStudentService.add(BmStudentStructMapper.INSTANCE.req2Dto(request));

        // 新增学生家长关联关系
        savePatStuRelation(bmPatriarchDTO, bmStudentDTO);

        // 是否开通 oj 开通进行开通 oj 账户
        if (request.getOjFlag()) {
            // TODO: 新增 OJ账户数据
        }
    }

    /**
     * 关联家长和学生
     */
    private void savePatStuRelation(BmPatriarchDTO bmPatriarchDTO, BmStudentDTO bmStudentDTO) {
        BmPatStuRelation patStuRelation = new BmPatStuRelation();
        patStuRelation.setId(IDGenerator.next());
        patStuRelation.setPatriarchId(bmPatriarchDTO.getId());
        patStuRelation.setPatriarchName(bmPatriarchDTO.getPatName());
        patStuRelation.setStudentId(bmStudentDTO.getId());
        patStuRelation.setStudentName(bmStudentDTO.getStuName());
        patStuRelation.setDelFlag(Delete.NO);

        boolean b = bmPatStuRelationService.save(patStuRelation);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增学生家长关联关系失败");
        }
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
