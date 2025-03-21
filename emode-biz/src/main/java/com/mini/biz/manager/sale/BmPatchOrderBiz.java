package com.mini.biz.manager.sale;

import com.mini.common.enums.str.OrderType;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.constant.LastSql;
import com.mini.common.constant.StuClassHourConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.HandlerClassStatus;
import com.mini.common.enums.str.OrderStatus;
import com.mini.common.enums.str.ProductShowStatus;
import com.mini.common.enums.str.ProductStatus;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.model.LoginUser;
import com.mini.common.utils.LoginUtils;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.service.*;
import com.mini.pojo.entity.course.BmHandlerClassOrderRelation;
import com.mini.pojo.entity.course.BmStuClassGrade;
import com.mini.pojo.entity.org.BmPatStuRelation;
import com.mini.pojo.mapper.sale.BmPatchOrderStructMapper;
import com.mini.pojo.model.dto.course.BmHandlerClassDTO;
import com.mini.pojo.model.dto.org.BmPatriarchDTO;
import com.mini.pojo.model.dto.org.BmStudentDTO;
import com.mini.pojo.model.dto.sale.BmPatchOrderDTO;
import com.mini.pojo.model.dto.sale.BmProductDTO;
import com.mini.pojo.model.edit.sale.BmPatchOrderEdit;
import com.mini.pojo.model.query.sale.BmPatchOrderQuery;
import com.mini.pojo.model.request.sale.BmPatchOrderRequest;
import com.mini.pojo.model.vo.sale.BmPatchOrderVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * @author zhl
 * @create 2024/12/3 17:42
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmPatchOrderBiz {

    private final BmPatchOrderService bmPatchOrderService;

    private final BmProductService bmProductService;

    private final BmPatriarchService bmPatriarchService;

    private final BmStudentService bmStudentService;

    private final BmStuClassGradeService bmStuClassGradeService;

    private final BmStuClassHourService bmStuClassHourService;

    private final BmHandlerClassService bmHandlerClassService;

    private final BmPatStuRelationService bmPatStuRelationService;

    private final BmHandlerClassOrderRelationService bmHandlerClassOrderRelationService;

    /**
     * 分页
     */
    public IPage<BmPatchOrderVo> page(BmPatchOrderQuery query) {
        IPage<BmPatchOrderDTO> page = bmPatchOrderService.page(query);
        return page.convert(BmPatchOrderStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条补单详情
     */
    public BmPatchOrderVo getEntityById(Long id) {
        BmPatchOrderDTO bmPatchOrderDTO = bmPatchOrderService.selectById(id);
        return BmPatchOrderStructMapper.INSTANCE.dto2Vo(bmPatchOrderDTO);
    }

    /**
     * 新增补单信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmPatchOrderRequest request) {
        // 1.校验商品信息、家长信息、学生信息是否存在
        // 商品信息
        BmProductDTO bmProductDTO = bmProductService.selectById(request.getProductId());
        if (Objects.isNull(bmProductDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前商品信息不存在");
        }
        // 校验商品状态信息
        if (ProductShowStatus.DELIST.equals(bmProductDTO.getShowStatus()) || ProductStatus.STOP.equals(bmProductDTO.getStatus())) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前商品状态信息不在可售范围内");
        }

        // 家长信息（补单人）
        BmPatriarchDTO bmPatriarchDTO = bmPatriarchService.selectById(request.getPatriarchId());
        if (Objects.isNull(bmPatriarchDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前家长信息不存在");
        }
        // 学生信息 （被核销人）
        BmStudentDTO bmStudentDTO = bmStudentService.selectById(request.getStudentId());
        if (Objects.isNull(bmStudentDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前学生信息不存在");
        }

        // 家长与学生关系是否存在
        checkPatStuRelation(bmPatriarchDTO, bmStudentDTO);

        // 2.创建补单订单，并且为已支付
        BmPatchOrderDTO bmPatchOrderDTO = getBmPatchOrderDTO(bmProductDTO, bmStudentDTO, bmPatriarchDTO);
        bmPatchOrderService.add(bmPatchOrderDTO);

        // 3.处理学生课时，有相同类型的课，课时进行累加操作
        bmStuClassHourService.handlerStuClassHour(bmStudentDTO.getId(), bmProductDTO.getCourseType(),
                StuClassHourConstant.ADD, bmProductDTO.getProductHour(), bmPatriarchDTO.getPatPhone());

        // 有对应的班级，直接进行新增此学生的课时信息
        BmStuClassGrade bmStuClassGrade = bmStuClassGradeService.selectByStuId(bmStudentDTO.getId(), bmProductDTO.getCourseType());
        if (Objects.nonNull(bmStuClassGrade)) {
            return;
        }

        // 查询是否有同类型的待分班数据，有进行累加
        BmHandlerClassDTO bmHandlerClassDTO1 = bmHandlerClassService.selectByStuId(bmStudentDTO.getId(), bmProductDTO.getCourseType());
        if (Objects.nonNull(bmHandlerClassDTO1)) {
            return;
        }

        // 4.新增待分班数据
        BmHandlerClassDTO bmHandlerClassDTO = new BmHandlerClassDTO();
        bmHandlerClassDTO.setId(IDGenerator.next());
        bmHandlerClassDTO.setStuId(bmStudentDTO.getId());
        bmHandlerClassDTO.setStuName(bmStudentDTO.getStuName());
        bmHandlerClassDTO.setIntentionCurTime(request.getIntentionCurTime());
        bmHandlerClassDTO.setConsumeTime(LocalDateTime.now());
        bmHandlerClassDTO.setCurType(bmProductDTO.getCourseType());
        bmHandlerClassDTO.setHandlerClassStatus(HandlerClassStatus.TO_HANDLER_CLASS);

        bmHandlerClassService.add(bmHandlerClassDTO);

        // 新增订单与待分班关联关系
        BmHandlerClassOrderRelation orderRelation = new BmHandlerClassOrderRelation();
        orderRelation.setId(IDGenerator.next());
        orderRelation.setHandlerClassId(bmHandlerClassDTO.getId());
        orderRelation.setOrderType(OrderType.PATCH);
        orderRelation.setCurOrderId(bmPatchOrderDTO.getId());
        orderRelation.setCurName(bmProductDTO.getProductName());
        orderRelation.setDelFlag(Delete.NO);

        bmHandlerClassOrderRelationService.save(orderRelation);
    }

    /**
     * 验证家长与学生关系是否存在
     */
    private void checkPatStuRelation(BmPatriarchDTO bmPatriarchDTO, BmStudentDTO bmStudentDTO) {
        LambdaQueryWrapper<BmPatStuRelation> wrapper = Wrappers.lambdaQuery(BmPatStuRelation.class);
        wrapper.eq(BmPatStuRelation::getPatriarchId, bmPatriarchDTO.getId())
                .eq(BmPatStuRelation::getStudentId, bmStudentDTO.getId())
                .eq(BmPatStuRelation::getDelFlag, Delete.NO)
                .last(LastSql.LIMIT_ONE);
        BmPatStuRelation bmPatStuRelation = bmPatStuRelationService.getOne(wrapper);

        if (Objects.isNull(bmPatStuRelation)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "当前家长与学生关系不存在");
        }
    }

    /**
     * 封装补单信息
     */
    @NotNull
    private static BmPatchOrderDTO getBmPatchOrderDTO(BmProductDTO bmProductDTO, BmStudentDTO bmStudentDTO, BmPatriarchDTO bmPatriarchDTO) {
        BmPatchOrderDTO bmPatchOrderDTO = new BmPatchOrderDTO();
        bmPatchOrderDTO.setId(IDGenerator.next());
        bmPatchOrderDTO.setPatchCreateTime(LocalDateTime.now());
        bmPatchOrderDTO.setPatchPrice(bmProductDTO.getProductPrice());
        bmPatchOrderDTO.setPatchReducedPrice(bmProductDTO.getProductPrice() - bmProductDTO.getProductReducedPrice());
        bmPatchOrderDTO.setPatchActualPrice(bmProductDTO.getProductReducedPrice());
        bmPatchOrderDTO.setPatchProductName(bmProductDTO.getProductName());
        bmPatchOrderDTO.setPatchConsume(bmStudentDTO.getStuName());
        bmPatchOrderDTO.setPatchPhone(bmPatriarchDTO.getPatPhone());
        bmPatchOrderDTO.setPatchStatus(OrderStatus.CONSUME_PAID);
        LoginUser loginUser = LoginUtils.getLoginUser();
        bmPatchOrderDTO.setPatchHandlerId(loginUser.getUserId());
        bmPatchOrderDTO.setPatchHandlerName(loginUser.getUsername());
        return bmPatchOrderDTO;
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmPatchOrderService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmPatchOrderEdit edit) {
        bmPatchOrderService.update(BmPatchOrderStructMapper.INSTANCE.edit2Dto(edit));
    }
}
