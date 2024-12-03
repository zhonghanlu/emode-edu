package com.mini.manager.org;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.enums.str.Gender;

import com.mini.biz.manager.org.BmStudentBiz;
import com.mini.pojo.model.edit.org.BmStudentEdit;
import com.mini.pojo.model.query.org.BmStudentQuery;
import com.mini.pojo.model.request.org.BmStudentRequest;
import com.mini.pojo.model.vo.org.BmStudentVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @author zhl
 * @create 2024/11/13 13:23
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmStudent {

    @Resource
    private BmStudentBiz bmStudentBiz;

    @Test
    void add() {
        BmStudentRequest request = new BmStudentRequest();
        request.setStuName("小明");
        request.setStuSex(Gender.MALE);
        request.setStuBirth(LocalDateTime.now());
        request.setStuCurSchool("新世纪");
        request.setStuCurGrade("初一");

        bmStudentBiz.insert(request);
    }

    @Test
    void del() {
        bmStudentBiz.del(1646199532683296L);
    }

    @Test
    void update() {
        BmStudentEdit edit = new BmStudentEdit();
        edit.setId(1646199532683296L);
        edit.setStuName("小李");
        edit.setStuSex(Gender.FEMALE);
        edit.setStuBirth(LocalDateTime.now());
        edit.setStuCurSchool("宁海");
        edit.setStuCurGrade("五年级");

        bmStudentBiz.update(edit);
    }

    @Test
    void page() {
        BmStudentQuery query = new BmStudentQuery();
        IPage<BmStudentVo> page = bmStudentBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmStudentBiz.getEntityById(1646199532683296L));
    }
}
