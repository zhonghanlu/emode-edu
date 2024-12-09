package com.mini.manager.operate;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.operate.BmPullNewBiz;
import com.mini.pojo.model.edit.operate.BmPullNewEdit;
import com.mini.pojo.model.query.operate.BmPullNewQuery;
import com.mini.pojo.model.request.operate.BmPullNewRequest;
import com.mini.pojo.model.vo.operate.BmPullNewVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @Author : zhl
 * @Date: 2024/12/9 20:38
 * @Description:
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmPullNew {

    @Resource
    private BmPullNewBiz bmPullNewBiz;

    @Test
    void add() {
        BmPullNewRequest request = new BmPullNewRequest();
        request.setSourcePatriarchId(1L);
        request.setSourcePatriarchName("张三");
        request.setInvitationCode("11122");
        request.setNewPatriarchId(2L);
        request.setNewPatriarchName("李四");
        request.setReward("100");
        request.setReason("嘻嘻");

        bmPullNewBiz.insert(request);
    }

    @Test
    void del() {
        bmPullNewBiz.del(1650594901131296L);
    }

    @Test
    void update() {
        BmPullNewEdit edit = new BmPullNewEdit();
        edit.setId(1650594901131296L);
        edit.setReason("没有原因");

        bmPullNewBiz.update(edit);
    }

    @Test
    void page() {
        BmPullNewQuery query = new BmPullNewQuery();
        IPage<BmPullNewVo> page = bmPullNewBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmPullNewBiz.getEntityById(1650594901131296L));
    }
}
