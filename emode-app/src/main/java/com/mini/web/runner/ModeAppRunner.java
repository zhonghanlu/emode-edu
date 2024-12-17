package com.mini.web.runner;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.biz.base.SysConfigBiz;
import com.mini.common.constant.RedisConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.IntentionCurTime;
import com.mini.common.utils.http.IPUtils;
import com.mini.common.utils.redis.RedisUtils;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.*;
import com.mini.pojo.entity.org.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * @author zhl
 * @create 2024/7/31 15:17
 */
@Slf4j
@Order(value = 2)
@Component
@RequiredArgsConstructor
public class ModeAppRunner implements ApplicationRunner {

    private final SysConfigBiz sysConfigBiz;

    private final BmStudentConstantService bmStudentConstantService;

    private final BmClassroomService bmClassroomService;

    private final BmClassroomIntentionService bmClassroomIntentionService;

    private final BmTeacherService bmTeacherService;

    private final BmTeacherIntentionService bmTeacherIntentionService;

    @Value("${server.port}")
    private String serverPort;

    @Override
    public void run(ApplicationArguments args) {
        log.info("openApi3接口地址 http://{}:{}/doc.html", IPUtils.getIp(), serverPort);

        log.info("全局token设置,添加在接口文档登录的AfterScript：{}", "\n" +
                "var code=ke.response.data.code;\n" +
                "if(code===200){\n" +
                "    //判断,如果服务端响应code是200才执行操作\n" +
                "    //获取token\n" +
                "    var token=ke.response.data.data.token;\n" +
                "    //1、如何参数是Header，则设置当前逻辑分组下的全局Header\n" +
                "    ke.global.setAllHeader(\"Authorization\",\"Bearer \" + token);\n" +
                "}\n");

        // 参数缓存
        Map<String, String> map = sysConfigBiz.selectAllForMap();
        if (CollectionUtils.isNotEmpty(map.keySet())) {
            map.keySet().forEach(key -> RedisUtils.setCacheObject(RedisConstant.SYS_CONFIG_KEY + key, map.get(key)));
        }

        // 学校与年级缓存
        List<String> typeList = Arrays.asList(BmStudentConstant.GRADE_TYPE, BmStudentConstant.SCHOOL_TYPE);
        typeList.forEach(type -> {
            LambdaQueryWrapper<BmStudentConstant> wrapper = Wrappers.lambdaQuery(BmStudentConstant.class);
            wrapper.eq(BmStudentConstant::getType, type);
            List<BmStudentConstant> bmStudentConstantList = bmStudentConstantService.list(wrapper);
            // 键入
            if (CollectionUtils.isNotEmpty(bmStudentConstantList)) {
                String redisKey = RedisConstant.SCHOOL_OR_GRADE + type + RedisConstant.PLACEHOLDER;
                // 先清除 后塞入 保证缓存与 key 一致
                RedisUtils.deleteObject(redisKey);
                RedisUtils.setCacheList(redisKey, bmStudentConstantList);
                RedisUtils.expire(redisKey, Duration.ofDays(7));
            }
        });

        // 初始化教师与教室的意向时间数据
        List<IntentionCurTime> intentionCurTimeList = Arrays.asList(IntentionCurTime.values());
        // 处理教室与意向时间数据默认数据
        handlerClassroomIntention(intentionCurTimeList);
        // 处理教师与意向时间数据默认数据
        handlerTeacherIntention(intentionCurTimeList);

    }


    /**
     * 处理教室与意向时间数据默认数据
     */
    private void handlerClassroomIntention(List<IntentionCurTime> intentionCurTimeList) {
        // 所有教室
        LambdaQueryWrapper<BmClassroom> wrapper = Wrappers.lambdaQuery(BmClassroom.class);
        wrapper.eq(BmClassroom::getDelFlag, Delete.NO);
        List<BmClassroom> bmClassroomList = bmClassroomService.list(wrapper);

        // 教室关联关系
        LambdaQueryWrapper<BmClassroomIntention> wrapper1 = Wrappers.lambdaQuery(BmClassroomIntention.class);
        wrapper1.eq(BmClassroomIntention::getDelFlag, Delete.NO);
        List<BmClassroomIntention> bmClassroomIntentionList = bmClassroomIntentionService.list(wrapper1);
        // 根据教室id进行分组数据
        Map<Long, List<BmClassroomIntention>> bmClassroomIntentionMap = bmClassroomIntentionList
                .stream()
                .collect(Collectors
                        .groupingBy(BmClassroomIntention::getClassroomId));

        List<BmClassroomIntention> toSaveIntentionList = new ArrayList<>();

        // 判断哪些意向时间教室没有关联
        bmClassroomList.forEach(bmClassroom -> {
            List<BmClassroomIntention> classroomIntentionList = bmClassroomIntentionMap.get(bmClassroom.getId());
            // 教室没有关联任何意向时间，则添加默认数据
            if (CollectionUtils.isEmpty(classroomIntentionList)) {
                intentionCurTimeList.forEach(intentionCurTime -> {
                    BmClassroomIntention bmClassroomIntention = getBmClassroomIntention(bmClassroom, intentionCurTime);
                    toSaveIntentionList.add(bmClassroomIntention);
                });
                return;
            }

            // 有部分数据，进行取差集，进行批量新增
            List<IntentionCurTime> intentionCurTimeList1 = classroomIntentionList
                    .stream()
                    .map(BmClassroomIntention::getIntentionCurTime)
                    .collect(Collectors.toList());
            List<IntentionCurTime> diffList = new ArrayList<>(CollectionUtils.subtract(intentionCurTimeList, intentionCurTimeList1));

            if (CollectionUtils.isNotEmpty(diffList)) {
                diffList.forEach(intentionCurTime -> {
                    BmClassroomIntention bmClassroomIntention = getBmClassroomIntention(bmClassroom, intentionCurTime);
                    toSaveIntentionList.add(bmClassroomIntention);
                });
            }
        });

        bmClassroomIntentionService.saveBatch(toSaveIntentionList);
    }

    /**
     * 处理教室与意向时间数据默认数据
     */
    private void handlerTeacherIntention(List<IntentionCurTime> intentionCurTimeList) {
        // 所有教师
        LambdaQueryWrapper<BmTeacher> wrapper = Wrappers.lambdaQuery(BmTeacher.class);
        wrapper.eq(BmTeacher::getDelFlag, Delete.NO);
        List<BmTeacher> bmTeacherList = bmTeacherService.list(wrapper);

        // 教师关联关系
        LambdaQueryWrapper<BmTeacherIntention> wrapper1 = Wrappers.lambdaQuery(BmTeacherIntention.class);
        wrapper1.eq(BmTeacherIntention::getDelFlag, Delete.NO);
        List<BmTeacherIntention> bmTeacherIntentionList = bmTeacherIntentionService.list(wrapper1);
        // 根据教室id进行分组数据
        Map<Long, List<BmTeacherIntention>> bmTeacherIntentionMap = bmTeacherIntentionList
                .stream()
                .collect(Collectors
                        .groupingBy(BmTeacherIntention::getTeacherId));

        List<BmTeacherIntention> toSaveIntentionList = new ArrayList<>();

        // 判断哪些意向时间教室没有关联
        bmTeacherList.forEach(bmTeacher -> {
            List<BmTeacherIntention> teacherIntentionList = bmTeacherIntentionMap.get(bmTeacher.getId());
            // 教室没有关联任何意向时间，则添加默认数据
            if (CollectionUtils.isEmpty(teacherIntentionList)) {
                intentionCurTimeList.forEach(intentionCurTime -> {
                    BmTeacherIntention bmTeacherIntention = getBmTeacherIntention(bmTeacher, intentionCurTime);
                    toSaveIntentionList.add(bmTeacherIntention);
                });
                return;
            }

            // 有部分数据，进行取差集，进行批量新增
            List<IntentionCurTime> intentionCurTimeList1 = teacherIntentionList
                    .stream()
                    .map(BmTeacherIntention::getIntentionCurTime)
                    .collect(Collectors.toList());
            List<IntentionCurTime> diffList = new ArrayList<>(CollectionUtils.subtract(intentionCurTimeList, intentionCurTimeList1));

            if (CollectionUtils.isNotEmpty(diffList)) {
                diffList.forEach(intentionCurTime -> {
                    BmTeacherIntention bmTeacherIntention = getBmTeacherIntention(bmTeacher, intentionCurTime);
                    toSaveIntentionList.add(bmTeacherIntention);
                });
            }
        });

        bmTeacherIntentionService.saveBatch(toSaveIntentionList);
    }

    /**
     * 封装教师关联数据
     */
    private BmTeacherIntention getBmTeacherIntention(BmTeacher bmTeacher, IntentionCurTime intentionCurTime) {
        BmTeacherIntention bmTeacherIntention = new BmTeacherIntention();
        bmTeacherIntention.setId(IDGenerator.next());
        bmTeacherIntention.setTeacherId(bmTeacher.getId());
        bmTeacherIntention.setTeacherName(bmTeacher.getTeaName());
        bmTeacherIntention.setIntentionCurTime(intentionCurTime);
        bmTeacherIntention.setDelFlag(Delete.NO);
        return bmTeacherIntention;
    }

    /**
     * 封装教室关联数据
     */
    private static @NotNull BmClassroomIntention getBmClassroomIntention(BmClassroom bmClassroom, IntentionCurTime intentionCurTime) {
        BmClassroomIntention bmClassroomIntention = new BmClassroomIntention();
        bmClassroomIntention.setId(IDGenerator.next());
        bmClassroomIntention.setClassroomId(bmClassroom.getId());
        bmClassroomIntention.setClassroomName(bmClassroom.getRoomName());
        bmClassroomIntention.setIntentionCurTime(intentionCurTime);
        bmClassroomIntention.setDelFlag(Delete.NO);
        return bmClassroomIntention;
    }
}
