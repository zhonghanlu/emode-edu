package com.mini.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.BmClassGradeBiz;
import com.mini.pojo.model.edit.course.BmClassGradeEdit;
import com.mini.pojo.model.query.course.BmClassGradeQuery;
import com.mini.pojo.model.request.course.BmClassGradeRequest;
import com.mini.pojo.model.vo.course.BmClassGradeVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @author zhl
 * @create 2024/11/13 13:23
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmClassGrade {

    @Resource
    private BmClassGradeBiz bmClassGradeBiz;

    @Test
    void add() {
        BmClassGradeRequest request = new BmClassGradeRequest();
        request.setClassGradeName("班级1");
        request.setTeaId(1646204593111072L);
        request.setTeaName("王老师");
        request.setClassroomId(1646195281756192L);
        request.setClassroomName("东教室");
        bmClassGradeBiz.insert(request);
    }

    @Test
    void del() {
        bmClassGradeBiz.del(1647456745947168L);
    }

    @Test
    void update() {
        BmClassGradeEdit edit = new BmClassGradeEdit();
        edit.setId(1647456745947168L);
        edit.setClassGradeName("python一班");
        edit.setTeaId(1646200895832096L);
        edit.setTeaName("丽丽");
        edit.setClassroomId(1646195281756192L);
        edit.setClassroomName("东教室");

        bmClassGradeBiz.update(edit);
    }

    @Test
    void page() {
        BmClassGradeQuery query = new BmClassGradeQuery();
        query.setClassGradeName("一");
        query.setTeaName("");
        query.setClassroomName("");
        IPage<BmClassGradeVo> page = bmClassGradeBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmClassGradeBiz.getEntityById(1647456745947168L));
    }
}
