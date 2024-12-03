package com.mini.manager.course;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.enums.str.CourseType;

import java.time.LocalDateTime;

import com.mini.biz.manager.course.BmRepairCourseBiz;
import com.mini.pojo.model.edit.course.BmRepairCourseEdit;
import com.mini.pojo.model.query.course.BmRepairCourseQuery;
import com.mini.pojo.model.request.course.BmRepairCourseRequest;
import com.mini.pojo.model.vo.course.BmRepairCourseVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @author zhl
 * @create 2024/11/13 13:23
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmRepairCourse {

    @Resource
    private BmRepairCourseBiz bmRepairCourseBiz;

    @Test
    void add() {
        BmRepairCourseRequest request = new BmRepairCourseRequest();
        request.setRepairName("python1补");
        request.setCurType(CourseType.PYTHON);
        request.setWeekOne(7);
        request.setRepairStartTime(LocalDateTime.now());
        request.setRepairEndTime(LocalDateTime.now());

        bmRepairCourseBiz.insert(request);
    }

    @Test
    void del() {
        bmRepairCourseBiz.del(1L);
    }

    @Test
    void update() {
        BmRepairCourseEdit edit = new BmRepairCourseEdit();
        edit.setId(1647485726490656L);
        edit.setRepairName("cpp2补");
        edit.setCurType(CourseType.CPP);
        edit.setWeekOne(7);
        edit.setRepairStartTime(LocalDateTime.now());
        edit.setRepairEndTime(LocalDateTime.now());

        bmRepairCourseBiz.update(edit);
    }

    @Test
    void page() {
        BmRepairCourseQuery query = new BmRepairCourseQuery();
        query.setRepairName("");
        query.setCurType(CourseType.CPP);
        query.setWeekOne(0);
        query.setRepairStartTime(LocalDateTime.now());
        query.setRepairEndTime(LocalDateTime.now());

        IPage<BmRepairCourseVo> page = bmRepairCourseBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmRepairCourseBiz.getEntityById(1647485726490656L));
    }
}
