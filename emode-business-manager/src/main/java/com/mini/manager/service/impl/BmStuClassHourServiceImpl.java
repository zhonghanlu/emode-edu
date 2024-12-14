package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.LastSql;
import com.mini.common.constant.StuClassHourConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.CourseType;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.DecimalUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmStuClassHourMapper;
import com.mini.manager.mapper.BmStudentMapper;
import com.mini.manager.service.BmStuClassHourService;
import com.mini.pojo.entity.org.BmStuClassHour;
import com.mini.pojo.entity.org.BmStudent;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * <p>
 * 学生与课时关系 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-12-12
 */
@Service
@RequiredArgsConstructor
public class BmStuClassHourServiceImpl extends ServiceImpl<BmStuClassHourMapper, BmStuClassHour> implements BmStuClassHourService {

    private final BmStuClassHourMapper bmStuClassHourMapper;

    private final BmStudentMapper bmStudentMapper;

    @Override
    public Map<CourseType, Long> getAllTypeClassHour(long stuId) {

        LambdaQueryWrapper<BmStuClassHour> wrapper = Wrappers.lambdaQuery(BmStuClassHour.class);
        wrapper.eq(BmStuClassHour::getStuId, stuId);

        List<BmStuClassHour> bmStuClassHourList = bmStuClassHourMapper.selectList(wrapper);

        return bmStuClassHourList.stream().collect(Collectors.groupingBy(BmStuClassHour::getClassHourType, Collectors.summingLong(BmStuClassHour::getClassHour)));
    }

    @Override
    public BmStuClassHour getTypeClassHour(long stuId, CourseType courseType) {
        LambdaQueryWrapper<BmStuClassHour> wrapper = Wrappers.lambdaQuery(BmStuClassHour.class);
        wrapper.eq(BmStuClassHour::getStuId, stuId).eq(BmStuClassHour::getClassHourType, courseType).last(LastSql.LIMIT_ONE);
        return bmStuClassHourMapper.selectOne(wrapper);
    }

    /**
     * @param stuId      学生 id
     * @param courseType 课程类型
     * @param optType    操作类型 增加 减少
     * @param classHour  操作课时
     * @param phone      通知家长课时信息
     */
    @Override
    public void handlerStuClassHour(long stuId, CourseType courseType, Integer optType, long classHour, String phone) {
        BmStuClassHour typeClassHour = getTypeClassHour(stuId, courseType);
        if (Objects.isNull(typeClassHour)) {
            // 当前课时类型不存在不允许进行减少操作
            if (StuClassHourConstant.SUBTRACT.equals(optType)) {
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前课时类型对应课时不存在不可做减少操作");
            }
            // 新增课时操作
            BmStuClassHour bmStuClassHour = new BmStuClassHour();
            bmStuClassHour.setId(IDGenerator.next());
            bmStuClassHour.setClassHourType(courseType);
            bmStuClassHour.setClassHour(classHour);
            bmStuClassHour.setStuId(stuId);
            LambdaQueryWrapper<BmStudent> wrapper = Wrappers.lambdaQuery(BmStudent.class);
            wrapper.eq(BmStudent::getId, stuId).eq(BmStudent::getDelFlag, Delete.NO).last(LastSql.LIMIT_ONE);
            BmStudent bmStudent = bmStudentMapper.selectOne(wrapper);
            bmStuClassHour.setStuName(bmStudent.getStuName());
            int b = bmStuClassHourMapper.insert(bmStuClassHour);
            if (b <= 0) {
                throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增课时失败");
            }
            return;
        }

        // 修改操作
        Long targetClassHour = typeClassHour.getClassHour();
        if (StuClassHourConstant.SUBTRACT.equals(optType)) {
            // 课时进行减少操作
            targetClassHour = DecimalUtil.sub(targetClassHour, classHour);
            // 减少之后小于最大承受负课时，进行抛异常
            if (targetClassHour < StuClassHourConstant.LOSE_CLASS_HOUR) {
                // TODO: 发送短信通知
                throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, typeClassHour.getStuName() + "课时不足");
            }

            if (targetClassHour < StuClassHourConstant.WARNING_CLASS_HOUR) {
                // TODO: 预警短信提醒
            }
        }
        if (StuClassHourConstant.ADD.equals(optType)) {
            // 课时进行增加操作
            targetClassHour = DecimalUtil.add(targetClassHour, classHour);
            // TODO：短信通知家长课时学生课时新增
        }
        typeClassHour.setClassHour(targetClassHour);
        bmStuClassHourMapper.updateById(typeClassHour);
    }
}
