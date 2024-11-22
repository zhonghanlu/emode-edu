package com.mini.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.BmCourseBiz;
import com.mini.common.enums.str.CourseType;
import com.mini.pojo.model.edit.BmCourseEdit;
import com.mini.pojo.model.query.BmCourseQuery;
import com.mini.pojo.model.request.BmCourseRequest;
import com.mini.pojo.model.vo.BmCourseVo;
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
class TestBmCourse {

    @Resource
    private BmCourseBiz bmCourseBiz;

    @Test
    void add() {
        BmCourseRequest request = new BmCourseRequest();
        request.setCourseType(CourseType.PYTHON);
        request.setCourseName("python一班1次课");
        request.setWeekOne(6);
        request.setCourseStartTime(LocalDateTime.now());
        request.setCourseEndTime(LocalDateTime.now());
        request.setClassPersonSize(5);
        request.setClassRoomId(1646195281756192L);
        request.setClassRoomName("西教室");
        request.setTeaId(1646204593111072L);
        request.setTeaName("王老师");
        request.setClassGradeId(1647456745947168L);
        request.setClassGradeName("");
        bmCourseBiz.insert(request);
    }

    @Test
    void del() {
        bmCourseBiz.del(1647459832954912L);
    }

    @Test
    void update() {
        BmCourseEdit edit = new BmCourseEdit();
        edit.setId(1647459832954912L);
        edit.setCourseType(CourseType.SCRATCH);
        edit.setCourseName("scratch一班2次课");
        edit.setWeekOne(7);
        edit.setCourseStartTime(LocalDateTime.now());
        edit.setCourseEndTime(LocalDateTime.now());
        edit.setClassPersonSize(6);
        edit.setClassRoomId(1646195281756192L);
        edit.setClassRoomName("西教室");
        edit.setTeaId(1646200895832096L);
        edit.setTeaName("");
        edit.setClassGradeId(1647456745947168L);
        edit.setClassGradeName("");
        bmCourseBiz.update(edit);
    }

    @Test
    void page() {
        BmCourseQuery query = new BmCourseQuery();
        query.setCourseType(CourseType.SCRATCH);
//        query.setCourseName("");
//        query.setWeekOne(0);
//        query.setCourseStartTime(LocalDateTime.now());
//        query.setCourseEndTime(LocalDateTime.now());
//        query.setClassRoomName("");
//        query.setTeaName("");
//        query.setClassGradeName("");
        IPage<BmCourseVo> page = bmCourseBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmCourseBiz.getEntityById(1647459832954912L));
    }
}
