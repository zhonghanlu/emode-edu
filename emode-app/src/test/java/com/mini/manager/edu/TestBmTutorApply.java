package com.mini.manager.edu;

import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.ApplyStatus;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.edu.BmTutorApplyBiz;
import com.mini.pojo.model.edit.edu.BmTutorApplyEdit;
import com.mini.pojo.model.query.edu.BmTutorApplyQuery;
import com.mini.pojo.model.request.edu.BmTutorApplyRequest;
import com.mini.pojo.model.vo.edu.BmTutorApplyVo;
import com.mini.pojo.model.vo.org.BmOrgVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @author zhl
 * @create 2024年12月5日14:14:18
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmTutorApply {

    @Resource
    private BmTutorApplyBiz bmTutorApplyBiz;

    @Test
    void add() {
        BmTutorApplyRequest request = new BmTutorApplyRequest();
        request.setApplyStuId(1L);
        request.setApplyName("张三");
        request.setApplySubject(CourseType.PYTHON);
        request.setApplyTime("2020-02-02 -- 2024-01-01");
        request.setApplyTutorId(1646200895832096L);
        request.setApplyTutorTeaName("李四");
        request.setExpendClassHour(4);
        request.setApplyAddress("江苏省南京市嘻嘻");
        bmTutorApplyBiz.insert(request);
    }

    @Test
    void del() {
        bmTutorApplyBiz.del(1649822910119968L);
    }

    @Test
    void update() {
        BmTutorApplyEdit edit = new BmTutorApplyEdit();
        edit.setId(1649822910119968L);
        edit.setApplyStatus(ApplyStatus.APPLY_END);

        bmTutorApplyBiz.update(edit);
    }

    @Test
    void page() {
        BmTutorApplyQuery query = new BmTutorApplyQuery();
        IPage<BmTutorApplyVo> page = bmTutorApplyBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmTutorApplyBiz.getEntityById(1649822910119968L));
    }
}
