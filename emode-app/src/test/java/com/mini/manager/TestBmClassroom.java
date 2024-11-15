package com.mini.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.enums.str.RoomStatus;

import com.mini.biz.manager.BmClassroomBiz;
import com.mini.pojo.model.edit.BmClassroomEdit;
import com.mini.pojo.model.query.BmClassroomQuery;
import com.mini.pojo.model.request.BmClassroomRequest;
import com.mini.pojo.model.vo.BmClassroomVo;
import com.mini.web.ModeApplication;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

/**
 * @author zhl
 * @create 2024/11/13 13:23
 */
@SpringBootTest(classes = ModeApplication.class)
class TestBmClassroom {

    @Resource
    private BmClassroomBiz bmClassroomBiz;

    @Test
    void add() {
        BmClassroomRequest request = new BmClassroomRequest();
        request.setRoomName("东教室");
        request.setRoomStatus(RoomStatus.ENABLE);
        request.setRoomSize(10);
        bmClassroomBiz.insert(request);
    }

    @Test
    void del() {
        bmClassroomBiz.del(1646195281756192L);
    }

    @Test
    void update() {
        BmClassroomEdit edit = new BmClassroomEdit();
        edit.setId(1646195281756192L);
        edit.setRoomName("西教室");
        edit.setRoomStatus(RoomStatus.DISABLE);
        edit.setRoomSize(22);
        bmClassroomBiz.update(edit);
    }

    @Test
    void page() {
        BmClassroomQuery query = new BmClassroomQuery();
        IPage<BmClassroomVo> voIPage = bmClassroomBiz.page(query);
        System.out.println(voIPage.getRecords());
    }

    @Test
    void byId() {
        System.out.println(bmClassroomBiz.getEntityById(1646195281756192L));
    }
}
