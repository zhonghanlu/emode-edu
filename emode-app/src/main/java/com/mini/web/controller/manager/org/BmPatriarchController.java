package com.mini.web.controller.manager.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.biz.manager.org.BmPatriarchBiz;
import com.mini.common.utils.webmvc.Restful;
import com.mini.pojo.model.edit.org.BmPatriarchEdit;
import com.mini.pojo.model.query.org.BmPatriarchQuery;
import com.mini.pojo.model.request.org.BmPatriarchRequest;
import com.mini.pojo.model.vo.org.BmPatRelationStuVo;
import com.mini.pojo.model.vo.org.BmPatriarchPullVo;
import com.mini.pojo.model.vo.org.BmPatriarchVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 家长表 前端控制器
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Tag(name = "家长管理", description = "家长管理")
@Slf4j
@Validated
@RestController
@RequestMapping("/bm-patriarch")
@RequiredArgsConstructor
public class BmPatriarchController {

    private final BmPatriarchBiz patriarchBiz;

    @Operation(summary = "家长分页")
    @GetMapping("/page")
    public Restful<IPage<BmPatriarchVo>> page(@ParameterObject BmPatriarchQuery query) {
        return Restful.OBJECT(patriarchBiz.page(query)).build();
    }

    @Operation(summary = "家长详情")
    @GetMapping("/detail/{patriarchId}")
    public Restful<BmPatriarchVo> getDetailById(@PathVariable("patriarchId") Long id) {
        return Restful.OBJECT(patriarchBiz.getEntityById(id)).build();
    }

    @Operation(summary = "家长关联的孩子信息")
    @GetMapping("/detail-relation-stu/{patriarchId}")
    public Restful<BmPatRelationStuVo> detailRelationStu(@PathVariable("patriarchId") Long id) {
        return Restful.OBJECT(patriarchBiz.detailRelationStu(id)).build();
    }

    @Operation(summary = "新增家长信息")
    @PostMapping("/add")
    public Restful<Void> insert(@RequestBody @Valid BmPatriarchRequest request) {
        patriarchBiz.insert(request);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "删除家长信息")
    @PostMapping("/del")
    public Restful<Void> del(Long id) {
        patriarchBiz.del(id);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "修改家长信息")
    @PostMapping("/update")
    public Restful<Void> update(@RequestBody @Valid BmPatriarchEdit edit) {
        patriarchBiz.update(edit);
        return Restful.SUCCESS().build();
    }

    @Operation(summary = "家长信息下拉")
    @PostMapping("/info-pull")
    public Restful<List<BmPatriarchPullVo>> infoPull(@RequestParam(value = "patName", required = false) String patName) {
        return Restful.OBJECT(patriarchBiz.infoPull(patName)).build();
    }

}
