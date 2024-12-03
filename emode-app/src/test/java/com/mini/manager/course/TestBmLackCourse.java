package com.mini.manager.course;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.course.BmLackCourseBiz;
import com.mini.common.enums.str.CourseType;
import com.mini.common.enums.str.YesOrNo;
import com.mini.pojo.model.edit.course.BmLackCourseEdit;
import com.mini.pojo.model.query.course.BmLackCourseQuery;
import com.mini.pojo.model.request.course.BmLackCourseRequest;
import com.mini.pojo.model.vo.course.BmLackCourseVo;
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
class TestBmLackCourse {

    @Resource
    private BmLackCourseBiz bmLackCourseBiz;

    @Test
    void add() {
        BmLackCourseRequest request = new BmLackCourseRequest();
        request.setClassGradeId(1647456745947168L);
        request.setClassGradeName("");
        request.setCurType(CourseType.PYTHON);
        request.setCurName("");
        request.setCurId(1647459832954912L);
        request.setWeekOne(6);
        request.setLackStartTime(LocalDateTime.now());
        request.setLackEndTime(LocalDateTime.now());
        request.setStuId(1646206692360224L);
        request.setStuName("");
        request.setLackStatus(YesOrNo.NO);

        bmLackCourseBiz.insert(request);
    }

    @Test
    void del() {
        bmLackCourseBiz.del(1647483771944992L);
    }

    @Test
    void update() {
        BmLackCourseEdit edit = new BmLackCourseEdit();
        edit.setId(1647483771944992L);
        edit.setLackStartTime(LocalDateTime.now());
        edit.setLackEndTime(LocalDateTime.now());
        edit.setLackStatus(YesOrNo.YES);

        bmLackCourseBiz.update(edit);
    }

    @Test
    void page() {
        BmLackCourseQuery query = new BmLackCourseQuery();
        query.setLackStatus(YesOrNo.YES);

        IPage<BmLackCourseVo> page = bmLackCourseBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmLackCourseBiz.getEntityById(1647483771944992L));
    }
}
