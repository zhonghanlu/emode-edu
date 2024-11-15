package com.mini.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.enums.str.YesOrNo;

import com.mini.biz.manager.BmOrgBiz;
import com.mini.pojo.model.edit.BmOrgEdit;
import com.mini.pojo.model.query.BmOrgQuery;
import com.mini.pojo.model.request.BmOrgRequest;
import com.mini.pojo.model.vo.BmOrgVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @author zhl
 * @create 2024/11/13 13:23
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmOrg {

    @Resource
    private BmOrgBiz bmOrgBiz;

    @Test
    void add() {
        BmOrgRequest request = new BmOrgRequest();
        request.setOrgName("启智编梦");
        request.setOrgAddress("江苏省徐州市睢宁县");
        request.setOrgLongitude("11111");
        request.setOrgLatitude("22222");
        request.setOrgDescribed("是俩位怀揣着梦想的少年打造的少儿编程机构");
        request.setOrgStatus(YesOrNo.YES);
        request.setOrgHeadA("仲寒露");
        request.setOrgHeadB("王斯亮");
        request.setOrgBusinessLicense(1L);
        bmOrgBiz.insert(request);
    }

    @Test
    void del() {
        bmOrgBiz.del(1645826375942176L);
    }

    @Test
    void update() {
        BmOrgEdit edit = new BmOrgEdit();
        edit.setId(1645826375942176L);
        edit.setOrgStatus(YesOrNo.YES);
        edit.setOrgBusinessLicense(2L);
        bmOrgBiz.update(edit);
    }

    @Test
    void page() {
        BmOrgQuery query = new BmOrgQuery();
        query.setOrgName("梦");
        query.setOrgStatus(YesOrNo.YES);
        IPage<BmOrgVo> page = bmOrgBiz.page(query);
        System.out.println(page.getRecords());
    }

    @Test
    void byId() {
        BmOrgVo bmOrgVo = bmOrgBiz.getEntityById(1645826375942176L);
        System.out.println(bmOrgVo);
    }
}
