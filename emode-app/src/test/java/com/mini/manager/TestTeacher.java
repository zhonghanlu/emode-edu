package com.mini.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.BmTeacherBiz;
import com.mini.pojo.model.edit.org.BmTeacherEdit;
import com.mini.pojo.model.query.org.BmTeacherQuery;
import com.mini.pojo.model.request.org.BmTeacherRequest;
import com.mini.pojo.model.vo.org.BmTeacherVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @author zhl
 * @create 2024/11/13 13:23
 */
@SpringBootTest(classes = ModeApplication.class)
class TestTeacher {

    @Resource
    private BmTeacherBiz bmTeacherBiz;

    @Test
    void add() {
        BmTeacherRequest request = new BmTeacherRequest();
        request.setTeaAvatarId(2L);
        request.setTeaName("张张");
        request.setTeaIphone("15312665454");
        request.setTeaEmail("1420865757@qq.com");
        request.setTeaOrgId(1645826375942176L);
        request.setTeaOrgName("嘿嘿");

        bmTeacherBiz.insert(request);
    }

    @Test
    void del() {
        bmTeacherBiz.del(1646200895832096L);
    }

    @Test
    void update() {
        BmTeacherEdit edit = new BmTeacherEdit();
        edit.setId(1646200895832096L);
        edit.setTeaAvatarId(0L);
        edit.setTeaName("丽丽");
        edit.setTeaIphone("17321729457");
        edit.setTeaOrgId(1645831847411744L);
        edit.setTeaOrgName("111");

        bmTeacherBiz.update(edit);
    }

    @Test
    void page() {
        BmTeacherQuery query = new BmTeacherQuery();
        IPage<BmTeacherVo> page = bmTeacherBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmTeacherBiz.getEntityById(1646200895832096L));
    }
}
