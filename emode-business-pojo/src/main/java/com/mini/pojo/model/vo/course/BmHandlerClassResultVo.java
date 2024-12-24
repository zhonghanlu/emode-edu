package com.mini.pojo.model.vo.course;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author zhl
 * @create 2024/12/24 11:07
 */
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
public class BmHandlerClassResultVo {

    /**
     * 预分班数据
     */
    @Schema(title = "预分班数据")
    private List<BmPreHandlerClassVo> bmPreHandlerClassVoList;

    /**
     * 失败分班数据
     */
    @Schema(title = "失败分班数据")
    private List<BmFailHandlerClassVo> bmFailHandlerClassVoList;

}
