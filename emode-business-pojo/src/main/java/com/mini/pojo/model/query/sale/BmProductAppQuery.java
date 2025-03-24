package com.mini.pojo.model.query.sale;

import com.mini.common.utils.webmvc.PageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author : zhl
 * @Date: 2025/3/24 21:08
 * @Description:
 */
@Schema(description = "小程序课程商品查询")
@Data
@EqualsAndHashCode(callSuper = true)
public class BmProductAppQuery extends PageQuery {
}
