//package com.mini.manager.course;
//
//import com.baomidou.mybatisplus.core.metadata.IPage;
//import com.mini.biz.manager.course.BmCourseScheduleBiz;
//import com.mini.pojo.model.edit.course.BmCourseScheduleEdit;
//import com.mini.pojo.model.query.course.BmCourseScheduleQuery;
//import com.mini.pojo.model.request.course.BmCourseScheduleRequest;
//import com.mini.pojo.model.vo.course.BmCourseScheduleVo;
//import com.mini.web.ModeApplication;
//import org.junit.jupiter.api.Test;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import javax.annotation.Resource;
//import java.time.LocalDateTime;
//
///**
// * @author zhl
// * @create 2024/11/13 13:23
// */
//@SpringBootTest(classes = ModeApplication.class)
//class TestBmCourseSchedule {
//
//    @Resource
//    private BmCourseScheduleBiz bmCourseScheduleBiz;
//
//    @Test
//    void add() {
//        BmCourseScheduleRequest request = new BmCourseScheduleRequest();
//        request.setCurScheduleName("24年11月10-24年11月20日");
//        request.setCurScheduleStarTime(LocalDateTime.now());
//        request.setCurScheduleEndTime(LocalDateTime.now());
//        bmCourseScheduleBiz.insert(request);
//    }
//
//    @Test
//    void del() {
//        bmCourseScheduleBiz.del(1647478726197280L);
//    }
//
//    @Test
//    void update() {
//        BmCourseScheduleEdit edit = new BmCourseScheduleEdit();
//        edit.setId(1647478726197280L);
//        edit.setCurScheduleName("24年11月10-24年11月21日");
//        edit.setCurScheduleStarTime(LocalDateTime.now());
//        edit.setCurScheduleEndTime(LocalDateTime.now());
//        bmCourseScheduleBiz.update(edit);
//    }
//
//    @Test
//    void page() {
//        BmCourseScheduleQuery query = new BmCourseScheduleQuery();
//        IPage<BmCourseScheduleVo> page = bmCourseScheduleBiz.page(query);
//        System.out.println(page.getRecords());
//    }
//
//    @Test
//    void byId() {
//        System.out.println(bmCourseScheduleBiz.getEntityById(1647478726197280L));
//    }
//}
