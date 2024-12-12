package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.manager.mapper.BmUserTeacherMapper;
import com.mini.manager.service.BmUserTeacherService;
import com.mini.pojo.entity.org.BmUserTeacher;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 教师与系统账户关联关系表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-12
 */
@Service
public class BmUserTeacherServiceImpl extends ServiceImpl<BmUserTeacherMapper, BmUserTeacher> implements BmUserTeacherService {

}
