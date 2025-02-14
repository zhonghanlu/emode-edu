package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.manager.mapper.BmCourseScheduleItemMapper;
import com.mini.manager.service.BmCourseScheduleItemService;
import com.mini.pojo.entity.course.BmCourseScheduleItem;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课表内容主体表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Service
@RequiredArgsConstructor
public class BmCourseScheduleItemServiceImpl extends ServiceImpl<BmCourseScheduleItemMapper, BmCourseScheduleItem> implements BmCourseScheduleItemService {

    private final BmCourseScheduleItemMapper bmCourseScheduleItemMapper;

    @Override
    public int existsCourseScheduleItem(long id) {
        return bmCourseScheduleItemMapper.existsCourseScheduleItem(id);
    }
}
