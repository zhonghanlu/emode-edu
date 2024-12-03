package com.mini.manager.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.org.BmPatriarchBiz;
import com.mini.pojo.model.edit.org.BmPatriarchEdit;
import com.mini.pojo.model.query.org.BmPatriarchQuery;
import com.mini.pojo.model.request.org.BmPatriarchRequest;
import com.mini.pojo.model.vo.org.BmPatriarchVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @author zhl
 * @create 2024/11/13 13:23
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmPatriarch {

    @Resource
    private BmPatriarchBiz bmPatriarchBiz;

    @Test
    void add() {
        BmPatriarchRequest request = new BmPatriarchRequest();
        request.setPatAvatarId(1L);
        request.setPatName("张三");
        request.setPatIphone("15312665707");
        request.setPatWx("15312665707ZZZ");
        request.setPatAddress("江苏省徐州市睢宁县");
        bmPatriarchBiz.insert(request);
    }

    @Test
    void del() {
        bmPatriarchBiz.del(1646197760589856L);
    }

    @Test
    void update() {
        BmPatriarchEdit edit = new BmPatriarchEdit();
        edit.setId(1646197760589856L);
        edit.setPatAvatarId(2L);
        edit.setPatName("李四");
        edit.setPatIphone("17321729457");
        bmPatriarchBiz.update(edit);
    }

    @Test
    void page() {
        BmPatriarchQuery query = new BmPatriarchQuery();
        IPage<BmPatriarchVo> page = bmPatriarchBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmPatriarchBiz.getEntityById(1646197760589856L));
    }
}
