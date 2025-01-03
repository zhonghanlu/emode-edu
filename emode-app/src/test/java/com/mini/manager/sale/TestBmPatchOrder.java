//package com.mini.manager.sale;
//
//import com.baomidou.mybatisplus.core.metadata.IPage;
//import com.mini.biz.manager.sale.BmPatchOrderBiz;
//import com.mini.common.enums.str.OrderStatus;
//import com.mini.pojo.model.edit.sale.BmPatchOrderEdit;
//import com.mini.pojo.model.query.sale.BmPatchOrderQuery;
//import com.mini.pojo.model.request.sale.BmPatchOrderRequest;
//import com.mini.pojo.model.vo.sale.BmPatchOrderVo;
//import com.mini.web.ModeApplication;
//import org.junit.jupiter.api.Test;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import javax.annotation.Resource;
//import java.time.LocalDateTime;
//
///**
// * @Author : zhl
// * @Date: 2024/12/3 20:11
// * @Description:
// */
//@SpringBootTest(classes = ModeApplication.class)
//class TestBmPatchOrder {
//
//    @Resource
//    private BmPatchOrderBiz bmPatchOrderBiz;
//
//    @Test
//    void add() {
//        BmPatchOrderRequest request = new BmPatchOrderRequest();
//        request.setPatchCreateTime(LocalDateTime.now());
//        request.setPatchPrice(49999900);
//        request.setPatchReducedPrice(49999900);
//        request.setPatchActualPrice(49999900);
//        request.setPatchProductName("C++60次课");
//        request.setPatchConsume("小张");
//        request.setPatchPhone("147258");
//        request.setPatchStatus(OrderStatus.TO_PAID);
//        request.setPatchHandlerId(2L);
//        request.setPatchHandlerName("嘻嘻");
//
//        bmPatchOrderBiz.insert(request);
//    }
//
//    @Test
//    void del() {
//        bmPatchOrderBiz.del(1645826375942176L);
//    }
//
//    @Test
//    void update() {
//        BmPatchOrderEdit edit = new BmPatchOrderEdit();
//        edit.setId(1649507571859488L);
//        edit.setPatchStatus(OrderStatus.ERROR_PAID);
//
//        bmPatchOrderBiz.update(edit);
//    }
//
//    @Test
//    void page() {
//        BmPatchOrderQuery query = new BmPatchOrderQuery();
//        IPage<BmPatchOrderVo> page = bmPatchOrderBiz.page(query);
//        System.out.println(page.getRecords());
//    }
//
//    @Test
//    void byId() {
//        BmPatchOrderVo bmPatchOrderVo = bmPatchOrderBiz.getEntityById(1649507571859488L);
//        System.out.println(bmPatchOrderVo);
//    }
//}
