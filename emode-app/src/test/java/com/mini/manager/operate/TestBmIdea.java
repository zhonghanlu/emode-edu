package com.mini.manager.operate;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.operate.BmIdeaBiz;
import com.mini.common.enums.str.IdeaType;
import com.mini.pojo.model.edit.operate.BmIdeaEdit;
import com.mini.pojo.model.query.operate.BmIdeaQuery;
import com.mini.pojo.model.request.operate.BmIdeaRequest;
import com.mini.pojo.model.vo.operate.BmIdeaVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @Author : zhl
 * @Date: 2024/12/9 20:37
 * @Description:
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmIdea {

    @Resource
    private BmIdeaBiz bmIdeaBiz;

    @Test
    void add() {
        BmIdeaRequest request = new BmIdeaRequest();
        request.setIdeaType(IdeaType.SYSTEM);
        request.setIdeaContent("这个软件做得太好了！！！");

        bmIdeaBiz.insert(request);
    }

    @Test
    void del() {
        bmIdeaBiz.del(1650593535885344L);
    }

    @Test
    void update() {
        BmIdeaEdit edit = new BmIdeaEdit();
        edit.setId(1650593535885344L);
        edit.setIdeaType(IdeaType.COURSE);

        bmIdeaBiz.update(edit);
    }

    @Test
    void page() {
        BmIdeaQuery query = new BmIdeaQuery();
        IPage<BmIdeaVo> page = bmIdeaBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmIdeaBiz.getEntityById(1650593535885344L));
    }

}
