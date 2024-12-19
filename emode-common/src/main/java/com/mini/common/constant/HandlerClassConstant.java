package com.mini.common.constant;

/**
 * @Author : zhl
 * @Date: 2024/12/19 21:19
 * @Description:
 */
public final class HandlerClassConstant {

    private HandlerClassConstant() {
    }

    // 没有意向时间的空班级    返回此类型的待分班数据
    public static final String NONE_INTENTION_CLASSROOM = "noneIntentionClassroom";

    // 超出意向时间空闲班级的最大承载数  返回此类型的待分班数据
    public static final String EXCEED_INTENTION_CLASSROOM = "exceedIntentionClassroom";

    // 超出意向时间空闲教师的最大数  返回此类型的待分班数据
    public static final String EXCEED_INTENTION_TEACHER = "exceedIntentionTeacher";

}
