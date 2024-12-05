package com.mini.manager.edu;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.edu.BmTutorTeacherBiz;
import com.mini.common.enums.str.CourseType;
import com.mini.pojo.model.edit.edu.BmTutorTeacherEdit;
import com.mini.pojo.model.query.edu.BmTutorTeacherQuery;
import com.mini.pojo.model.request.edu.BmTutorTeacherRequest;
import com.mini.pojo.model.vo.edu.BmTutorTeacherVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.Arrays;

/**
 * @author zhl
 * @create 2024年12月5日14:14:14
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmTutorTeacher {

    @Resource
    private BmTutorTeacherBiz bmTutorTeacherBiz;

    @Test
    void add() {
        BmTutorTeacherRequest request = new BmTutorTeacherRequest();
        request.setTeaId(1L);
        request.setTeaName("李四");
        request.setGiveClassType(Arrays.asList(CourseType.CPP, CourseType.PYTHON).toString());
        request.setLeisureTime("2024-02-02 -- 2024-02-02");
        request.setTutorDetail("滴滴滴滴滴滴滴滴");
        bmTutorTeacherBiz.insert(request);
    }

    @Test
    void del() {
        bmTutorTeacherBiz.del(1649823549751328L);
    }

    @Test
    void update() {
        BmTutorTeacherEdit edit = new BmTutorTeacherEdit();
        edit.setId(1649823549751328L);
        edit.setGiveClassType(Arrays.asList(CourseType.SCRATCH).toString());

        bmTutorTeacherBiz.update(edit);
    }

    @Test
    void page() {
        BmTutorTeacherQuery query = new BmTutorTeacherQuery();
        IPage<BmTutorTeacherVo> page = bmTutorTeacherBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmTutorTeacherBiz.getEntityById(1649823549751328L));
    }
}
