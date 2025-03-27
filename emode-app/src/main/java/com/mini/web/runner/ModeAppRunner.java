package com.mini.web.runner;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.biz.base.SysConfigBiz;
import com.mini.common.constant.RedisConstant;
import com.mini.common.enums.str.CurTutorType;
import com.mini.common.utils.http.IPUtils;
import com.mini.common.utils.redis.RedisUtils;
import com.mini.manager.service.BmCourseRationService;
import com.mini.manager.service.BmStudentConstantService;
import com.mini.pojo.entity.org.BmCourseRation;
import com.mini.pojo.entity.org.BmStudentConstant;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @author zhl
 * @create 2024/7/31 15:17
 */
@Slf4j
@Order(value = 0)
@Component
@RequiredArgsConstructor
public class ModeAppRunner implements ApplicationRunner {

    private final SysConfigBiz sysConfigBiz;

    private final BmStudentConstantService bmStudentConstantService;

    private final BmCourseRationService bmCourseRationService;

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

        // 课程比例缓存
        List<BmCourseRation> bmCourseRationList = bmCourseRationService.list();
        if (CollectionUtils.isNotEmpty(bmCourseRationList)) {
            bmCourseRationList.forEach(bmCourseRation ->
                    RedisUtils.setCacheObject(RedisConstant.COURSE_TYPE_RATIO + ":" + bmCourseRation.getCurType().getStringValue(),
                            Double.valueOf(bmCourseRation.getRatio())));
        }

        // 预约课程比例缓存
        CurTutorType[] curTutorTypes = CurTutorType.values();
        Arrays.stream(curTutorTypes).forEach(curTutorType ->
                RedisUtils.setCacheObject(RedisConstant.COURSE_TYPE_RATIO + ":" + curTutorType.getStringValue(),
                        curTutorType.getSort()));

    }
}
