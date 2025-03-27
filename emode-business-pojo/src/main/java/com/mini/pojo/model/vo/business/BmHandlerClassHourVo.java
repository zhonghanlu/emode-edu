package com.mini.pojo.model.vo.business;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author : zhl
 * @Date: 2025/3/27 20:36
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BmHandlerClassHourVo {

    @Schema(title = "消耗课时")
    private Double expend;

    @Schema(title = "剩余课时")
    private Double residue;

}
