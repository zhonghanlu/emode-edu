package com.mini.biz.manager.course;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.enums.str.IntentionCurPeriodTime;
import com.mini.common.enums.str.IntentionCurWeekTime;
import com.mini.manager.service.BmHandlerClassService;
import com.mini.pojo.mapper.course.BmHandlerClassStructMapper;
import com.mini.pojo.model.dto.course.BmHandlerClassDTO;
import com.mini.pojo.model.dto.course.BmIntentionCurTimeDTO;
import com.mini.pojo.model.edit.course.BmHandlerClassEdit;
import com.mini.pojo.model.query.course.BmHandlerClassQuery;
import com.mini.pojo.model.request.course.BmHandlerClassRequest;
import com.mini.pojo.model.vo.course.BmHandlerClassVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * @author zhl
 * @create 2024/11/20 13:42
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmHandlerClassBiz {

    private final BmHandlerClassService bmHandlerClassService;

    public static final String PLACEHOLDER = ":";

    /**
     * 分页
     */
    public IPage<BmHandlerClassVo> page(BmHandlerClassQuery query) {
        IPage<BmHandlerClassDTO> page = bmHandlerClassService.page(query);

        // 处理意向时间
        page.getRecords().forEach(item -> {
            List<String> timeList = Arrays.asList(item.getIntentionCurTimeStr().split(PLACEHOLDER));
            item.setIntentionCurTime(
                    BmIntentionCurTimeDTO.builder()
                            .intentionCurWeekTime(IntentionCurWeekTime.get(timeList.get(0)))
                            .intentionCurPeriodTime(IntentionCurPeriodTime.get(timeList.get(1)))
                            .build()
            );
        });

        return page.convert(BmHandlerClassStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取待分班详情
     */
    public BmHandlerClassVo getEntityById(Long id) {
        BmHandlerClassDTO bmHandlerClassDTO = bmHandlerClassService.selectById(id);
        return BmHandlerClassStructMapper.INSTANCE.dto2Vo(bmHandlerClassDTO);
    }

    /**
     * 新增待分班信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmHandlerClassRequest request) {
        bmHandlerClassService.add(BmHandlerClassStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmHandlerClassService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmHandlerClassEdit edit) {
        bmHandlerClassService.update(BmHandlerClassStructMapper.INSTANCE.edit2Dto(edit));
    }
}
