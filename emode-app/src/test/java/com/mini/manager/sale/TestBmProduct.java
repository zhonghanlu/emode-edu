//package com.mini.manager.sale;
//import com.mini.common.enums.str.CourseType;
//import com.mini.common.enums.str.ClassType;
//import com.mini.common.enums.str.ProductStatus;
//import com.mini.common.enums.str.ProductShowStatus;
//
//import com.baomidou.mybatisplus.core.metadata.IPage;
//import com.mini.biz.manager.sale.BmProductBiz;
//import com.mini.pojo.model.edit.sale.BmProductEdit;
//import com.mini.pojo.model.query.sale.BmProductQuery;
//import com.mini.pojo.model.request.sale.BmProductRequest;
//import com.mini.pojo.model.vo.org.BmTeacherVo;
//import com.mini.pojo.model.vo.sale.BmProductVo;
//import com.mini.web.ModeApplication;
//import org.junit.jupiter.api.Test;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import javax.annotation.Resource;
//
///**
// * @Author : zhl
// * @Date: 2024/12/3 20:10
// * @Description:
// */
//@SpringBootTest(classes = ModeApplication.class)
//class TestBmProduct {
//
//    @Resource
//    private BmProductBiz bmProductBiz;
//
//    @Test
//    void add() {
//        BmProductRequest request = new BmProductRequest();
//        request.setProductUrl("aaa.jpg");
//        request.setProductUrlId(1L);
//        request.setProductName("python50次课");
//        request.setProductHour(50);
//        request.setProductPrice(49999900);
//        request.setProductReducedPrice(43999900);
//        request.setRecommendAge(10); // TODO  推荐年龄应该为范围区间
//        request.setCourseDetail("章节1");
//        request.setProductType(CourseType.PYTHON);
//        request.setClassType(ClassType.OFFLINE);
//        request.setStatus(ProductStatus.TEST);
//        request.setClassTime("暑假");  // TODO  授课时间段应该为枚举
//        request.setShowStatus(ProductShowStatus.LISTING);
//
//        bmProductBiz.insert(request);
//    }
//
//    @Test
//    void del() {
//        bmProductBiz.del(1649501483827232L);
//    }
//
//    @Test
//    void update() {
//        BmProductEdit edit = new BmProductEdit();
//        edit.setId(1649501483827232L);
//        edit.setProductName("python55次课");
//        bmProductBiz.update(edit);
//    }
//
//    @Test
//    void page() {
//        BmProductQuery query = new BmProductQuery();
//        IPage<BmProductVo> page = bmProductBiz.page(query);
//        System.out.println(page.getRecords());
//    }
//
//    @Test
//    void byId() {
//        System.out.println(bmProductBiz.getEntityById(1649501483827232L));
//    }
//
//}
