package com.mini.manager.sale;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.sale.BmOrderBiz;
import com.mini.common.enums.str.OrderStatus;
import com.mini.pojo.model.edit.sale.BmOrderEdit;
import com.mini.pojo.model.query.sale.BmOrderQuery;
import com.mini.pojo.model.request.sale.BmOrderRequest;
import com.mini.pojo.model.vo.sale.BmOrderVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.time.LocalDateTime;

/**
 * @Author : zhl
 * @Date: 2024/12/3 20:11
 * @Description:
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmOrder {

    @Resource
    private BmOrderBiz bmOrderBiz;

    @Test
    void add() {
        BmOrderRequest request = new BmOrderRequest();
        request.setOrderCreateTime(LocalDateTime.now());
        request.setOrderPrice(49999900);
        request.setOrderReducedPrice(45999900);
        request.setOrderActualPrice(45999900);
        request.setOrderProductName("python50次课，python30次课");
        request.setOrderConsume("小明");
        request.setOrderStatus(OrderStatus.TO_PAID);
        request.setOrderPhone("15312665707");
        request.setOrderConsumedId(1L);
        request.setOrderConsumedName("小王");

        bmOrderBiz.insert(request);
    }

    @Test
    void del() {
        bmOrderBiz.del(1649505279672352L);
    }

    @Test
    void update() {
        BmOrderEdit edit = new BmOrderEdit();
        edit.setId(1649505279672352L);
        edit.setOrderStatus(OrderStatus.CONSUME_PAID);
        bmOrderBiz.update(edit);
    }

    @Test
    void page() {
        BmOrderQuery query = new BmOrderQuery();
        IPage<BmOrderVo> page = bmOrderBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        BmOrderVo bmOrderVo = bmOrderBiz.getEntityById(1649505279672352L);
        System.out.println(bmOrderVo);
    }
}
