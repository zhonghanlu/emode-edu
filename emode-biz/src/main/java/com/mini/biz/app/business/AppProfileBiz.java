package com.mini.biz.app.business;

import com.mini.common.utils.LoginUtils;
import com.mini.manager.service.BmPatriarchService;
import com.mini.manager.service.BmStudentService;
import com.mini.pojo.mapper.org.BmStudentStructMapper;
import com.mini.pojo.model.dto.org.BmStudentDTO;
import com.mini.pojo.model.edit.org.BmStudentEdit;
import com.mini.pojo.model.vo.business.BmPatriarchStuProfileInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author zhl
 * @create 2025/3/18 16:14
 */
@Component
@RequiredArgsConstructor
public class AppProfileBiz {

    private final BmStudentService bmStudentService;

    private final BmPatriarchService bmPatriarchService;

    /**
     * 我的孩子
     */
    public List<BmPatriarchStuProfileInfo> getMyStuInfo() {
        Long patriarchId = LoginUtils.getLoginUser().getPatriarchId();
        return bmPatriarchService.patProfileStuInfo(patriarchId);
    }

    /**
     * 修改我的孩子信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateMyStuInfo(BmStudentEdit edit) {
        BmStudentDTO bmStudentDTO = BmStudentStructMapper.INSTANCE.edit2Dto(edit);
        bmStudentService.update(bmStudentDTO);
    }

    /**
     * 我的课程
     */

    /**
     * 我的订单
     */

    /**
     * 线上核销
     */

    /**
     * 线下核销码
     */

    /**
     * 拉新链接
     */

    /**
     * 拉新列表
     */

}
