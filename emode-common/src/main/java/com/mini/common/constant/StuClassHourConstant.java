package com.mini.common.constant;

/**
 * @Author : zhl
 * @Date: 2024/12/12 22:23
 * @Description:
 */
public final class StuClassHourConstant {

    private StuClassHourConstant() {
    }

    // 分隔
    public static final String PLACEHOLDER = ":";

    // 增加
    public static final Integer ADD = 0;

    // 减去
    public static final Integer SUBTRACT = 1;

    // 最大负课时
    public static final Long LOSE_CLASS_HOUR = -500L;

    // 最大负课时
    public static final Long WARNING_CLASS_HOUR = 500L;
}
