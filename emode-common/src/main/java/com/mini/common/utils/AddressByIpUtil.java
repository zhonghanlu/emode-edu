package com.mini.common.utils;

import com.mini.common.exception.service.EModeServiceException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.lionsoul.ip2region.xdb.Searcher;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * @author zhl
 * @create 2024/7/18 16:19
 */
@Slf4j
public class AddressByIpUtil {

    private AddressByIpUtil() {
    }

    // ip2region.xdb 文件地址常量（本地xdb文件路径）
    private static final String IP_DB_PATH = "ip/ip2region.xdb";


    private static final ThreadLocal<Searcher> SEARCHER_THREAD_LOCAL = ThreadLocal.withInitial(() -> {
        try {
            ClassPathResource cpr = new ClassPathResource(IP_DB_PATH);
            return Searcher.newWithBuffer(IOUtils.toByteArray(cpr.getInputStream()));
        } catch (IOException e) {
            log.error("创建ip库异常：{} ", e.getMessage());
            throw new EModeServiceException("Failed to create Searcher instance");
        }
    });

    /**
     * 完全基于ip2region.xdb文件，对用户ip地址进行转换
     * 注：并发调用时，每个线程需创建一个独立的searcher对象 单独使用。
     */
    public static String getIpPossessionByFile(String ip) {
        if (StringUtils.isNotEmpty(ip)) {
            try {
                // 1、创建 searcher 对象
                Searcher searcher = SEARCHER_THREAD_LOCAL.get();
                // 2、查询
                String region = searcher.search(ip);
                region = region.replace("|0", "");
                return region;
            } catch (Exception e) {
                log.error("获取IP地址异常：{} ", e.getMessage());
                throw new EModeServiceException("获取IP地址异常");
            }
        }
        return "未知";
    }

    /**
     * 刷新ip库
     */
    public static void refreshThreadLocal() {
        SEARCHER_THREAD_LOCAL.remove();
        try {
            SEARCHER_THREAD_LOCAL.set(Searcher.newWithFileOnly(IP_DB_PATH));
        } catch (IOException e) {
            throw new EModeServiceException("ip库异常");
        }
    }

}
