package com.mini.biz.app.business;

import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.LoginUtils;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.BmPatStuRelationService;
import com.mini.manager.service.BmPatriarchService;
import com.mini.manager.service.BmStudentService;
import com.mini.pojo.entity.org.BmPatStuRelation;
import com.mini.pojo.mapper.org.BmStudentStructMapper;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.dto.org.BmStudentDTO;
import com.mini.pojo.model.request.business.BmPatAddStuRequest;
import com.mini.pojo.model.vo.business.BmPatriarchStuInfoVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author zhl
 * @create 2025/3/18 14:56
 */
@Component
@RequiredArgsConstructor
public class AppHomeBiz {

    private final BmPatriarchService bmPatriarchService;

    private final BmStudentService bmStudentService;

    private final BmPatStuRelationService bmPatStuRelationService;


    /**
     * 首页轮播
     */

    /**
     * 最近一条消息
     */

    /**
     * 添加我的孩子
     */
    @Transactional(rollbackFor = Exception.class)
    public void addMyChild(BmPatAddStuRequest request) {
        // 新增学生数据
        BmStudentDTO bmStudentDTO = BmStudentStructMapper.INSTANCE.reqRelation2Dto(request);
        bmStudentService.add(bmStudentDTO);
        // 创建当前人与学生数据关联
        Long patriarchId = LoginUtils.getLoginUser().getPatriarchId();
        BmPatriarchDTO bmPatriarchDTO = bmPatriarchService.selectById(patriarchId);

        BmPatStuRelation relation = new BmPatStuRelation();
        relation.setId(IDGenerator.next());
        relation.setPatriarchId(patriarchId);
        relation.setPatriarchName(bmPatriarchDTO.getPatName());
        relation.setStudentId(bmStudentDTO.getId());
        relation.setStudentName(bmStudentDTO.getStuName());
        relation.setDelFlag(Delete.NO);

        boolean b = bmPatStuRelationService.save(relation);
        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增学生家长关联关系失败");
        }
    }

    /**
     * 我的孩子信息
     */
    public List<BmPatriarchStuInfoVo> myChildInfo() {
        Long patriarchId = LoginUtils.getLoginUser().getPatriarchId();
        return bmPatriarchService.selectMyChildInfo(patriarchId);
    }

    /**
     * 知识图谱
     */

    /**
     * 只是图片详细
     */

}
