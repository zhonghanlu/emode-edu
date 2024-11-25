package com.mini.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.BmHandlerClassBiz;
import com.mini.common.enums.str.CourseType;
import com.mini.pojo.model.edit.course.BmHandlerClassEdit;
import com.mini.pojo.model.query.course.BmHandlerClassQuery;
import com.mini.pojo.model.request.course.BmHandlerClassRequest;
import com.mini.pojo.model.vo.course.BmHandlerClassVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.time.LocalDateTime;

/**
 * @author zhl
 * @create 2024/11/13 13:23
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmHandlerClass {

    @Resource
    private BmHandlerClassBiz bmHandlerClassBiz;

    @Test
    void add() {
        BmHandlerClassRequest request = new BmHandlerClassRequest();
        request.setStuId(1646199532683296L);
        request.setStuName("小李");
        request.setIntentionCurTime(LocalDateTime.now());
        request.setConsumeTime(LocalDateTime.now());
        request.setCurType(CourseType.PYTHON);
        bmHandlerClassBiz.insert(request);
    }

    @Test
    void del() {
        bmHandlerClassBiz.del(1647480859000864L);
    }

    @Test
    void update() {
        BmHandlerClassEdit edit = new BmHandlerClassEdit();
        edit.setId(1647480859000864L);
        edit.setIntentionCurTime(LocalDateTime.now());
        edit.setConsumeTime(LocalDateTime.now());
        edit.setCurType(CourseType.SCRATCH);

        bmHandlerClassBiz.update(edit);
    }

    @Test
    void page() {
        BmHandlerClassQuery query = new BmHandlerClassQuery();
        query.setStuName("");
        query.setIntentionCurTime(LocalDateTime.now());
        query.setConsumeTime(LocalDateTime.now());
        query.setCurType(CourseType.SCRATCH);

        IPage<BmHandlerClassVo> page = bmHandlerClassBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmHandlerClassBiz.getEntityById(1647480859000864L));
    }
}
