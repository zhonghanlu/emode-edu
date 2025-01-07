package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmStudentMapper;
import com.mini.manager.service.BmStudentService;
import com.mini.pojo.entity.org.BmStudent;
import com.mini.pojo.mapper.org.BmStudentStructMapper;
import com.mini.pojo.model.dto.org.BmStudentDTO;
import com.mini.pojo.model.query.org.BmStudentQuery;
import com.mini.pojo.model.vo.org.BmStuClassTypeHourVo;
import com.mini.pojo.model.vo.org.BmStudentPatInfoVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * <p>
 * 学生表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmStudentServiceImpl extends ServiceImpl<BmStudentMapper, BmStudent> implements BmStudentService {

    private final BmStudentMapper bmStudentMapper;

    @Override
    public BmStudentDTO add(BmStudentDTO dto) {
        BmStudent bmStudent = BmStudentStructMapper.INSTANCE.dto2Entity(dto);

        bmStudent.setId(IDGenerator.next());
        bmStudent.setDelFlag(Delete.NO);

        int b = bmStudentMapper.insert(bmStudent);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }

        return BmStudentStructMapper.INSTANCE.entity2Dto(bmStudent);
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmStudent bmStudent = CommonMybatisUtil.getById(id, bmStudentMapper);

        if (Objects.isNull(bmStudent)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmStudent.setDelFlag(Delete.YES);
        int b = bmStudentMapper.updateById(bmStudent);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmStudentDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmStudentMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmStudent bmStudent = BmStudentStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmStudentMapper.updateById(bmStudent);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmStudentDTO selectById(long id) {
        return BmStudentStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmStudentMapper));
    }

    @Override
    public IPage<BmStudentDTO> page(BmStudentQuery query) {
        return bmStudentMapper.page(query, query.build());
    }

    @Override
    public Map<Long, BmStudent> selectByIdListForMap(List<Long> stuIdList) {
        LambdaQueryWrapper<BmStudent> wrapper = Wrappers.lambdaQuery(BmStudent.class);
        wrapper.in(BmStudent::getId, stuIdList)
                .eq(BmStudent::getDelFlag, Delete.NO);
        List<BmStudent> bmStudentList = bmStudentMapper.selectList(wrapper);
        return bmStudentList.stream().collect(Collectors.toMap(BmStudent::getId, Function.identity()));
    }

    @Override
    public BmStudentPatInfoVo searchPatriarchInfo(Long id) {
        return bmStudentMapper.searchPatriarchInfo(id);
    }

    @Override
    public BmStuClassTypeHourVo searchStuClassTypeHour(Long id) {
        return bmStudentMapper.searchStuClassTypeHour(id);
    }
}
