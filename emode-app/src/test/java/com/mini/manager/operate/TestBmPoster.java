package com.mini.manager.operate;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.operate.BmPosterBiz;
import com.mini.common.enums.str.PosterType;
import com.mini.common.enums.str.YesOrNo;
import com.mini.pojo.model.edit.operate.BmPosterEdit;
import com.mini.pojo.model.query.operate.BmPosterQuery;
import com.mini.pojo.model.request.operate.BmPosterRequest;
import com.mini.pojo.model.vo.operate.BmPosterVo;
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
class TestBmPoster {

    @Resource
    private BmPosterBiz bmPosterBiz;

    @Test
    void add() {
        BmPosterRequest request = new BmPosterRequest();
        request.setPosterFileId(1L);
        request.setPosterUrl("1.jpg");
        request.setPosterType(PosterType.OFFLINE_RECOMMENDED);
        request.setPosterStatus(YesOrNo.YES);
        request.setPosterOptName("小王");

        bmPosterBiz.insert(request);
    }

    @Test
    void del() {
        bmPosterBiz.del(1650594223751200L);
    }

    @Test
    void update() {
        BmPosterEdit edit = new BmPosterEdit();
        edit.setId(1650594223751200L);
        edit.setPosterType(PosterType.OFFLINE_RECOMMENDED);
        edit.setPosterStatus(YesOrNo.YES);
        edit.setPosterOptName("小李");

        bmPosterBiz.update(edit);
    }

    @Test
    void page() {
        BmPosterQuery query = new BmPosterQuery();
        IPage<BmPosterVo> page = bmPosterBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmPosterBiz.getEntityById(1650594223751200L));
    }
}
