package com.mini.pojo.model.request.course;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * <p>
 * 待分班数据表
 * </p>
 *
 * @author zhl
 * @since 2024-11-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmHandlerClassRequest {

    /**
     * 待分班数据 id
     */
    private List<Long> handlerIdList;

}
