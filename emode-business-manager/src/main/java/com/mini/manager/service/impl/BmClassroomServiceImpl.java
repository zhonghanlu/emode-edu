package com.mini.manager.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.enums.str.RoomStatus;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.mybatis.CommonMybatisUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.manager.mapper.BmClassroomMapper;
import com.mini.manager.service.BmClassroomService;
import com.mini.pojo.entity.org.BmClassroom;
import com.mini.pojo.mapper.BmClassroomStructMapper;
import com.mini.pojo.model.dto.org.BmClassroomDTO;
import com.mini.pojo.model.query.org.BmClassroomQuery;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * <p>
 * 教室表 服务实现类
 * </p>
 *
 * @author zhl
 * @since 2024-11-15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BmClassroomServiceImpl extends ServiceImpl<BmClassroomMapper, BmClassroom> implements BmClassroomService {

    private final BmClassroomMapper bmClassroomMapper;

    @Override
    public void add(BmClassroomDTO dto) {
        BmClassroom bmClassroom = BmClassroomStructMapper.INSTANCE.dto2Entity(dto);

        bmClassroom.setId(IDGenerator.next());
        bmClassroom.setDelFlag(Delete.NO);

        if (Objects.isNull(bmClassroom.getRoomStatus())) {
            bmClassroom.setRoomStatus(RoomStatus.ENABLE);
        }

        if (Objects.isNull(bmClassroom.getRoomSize())) {
            bmClassroom.setRoomSize(0);
        }

        int b = bmClassroomMapper.insert(bmClassroom);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增失败");
        }
    }

    @Override
    public void del(long id) {
        if (id <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "参数异常，id：" + id);
        }

        BmClassroom bmClassroom = CommonMybatisUtil.getById(id, bmClassroomMapper);

        if (Objects.isNull(bmClassroom)) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待删除数据不存在");
        }

        bmClassroom.setDelFlag(Delete.YES);
        int b = bmClassroomMapper.updateById(bmClassroom);

        if (b <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "删除失败");
        }
    }

    @Override
    public void update(BmClassroomDTO dto) {
        // 校验数据是否存在
        boolean b = CommonMybatisUtil.isExistById(dto.getId(), bmClassroomMapper);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.BUSINESS_ERROR, "当前待修改数据不存在");
        }

        BmClassroom bmClassroom = BmClassroomStructMapper.INSTANCE.dto2Entity(dto);

        int b1 = bmClassroomMapper.updateById(bmClassroom);

        if (b1 <= 0) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "更新失败");
        }
    }

    @Override
    public BmClassroomDTO selectById(long id) {
        return BmClassroomStructMapper.INSTANCE.entity2Dto(CommonMybatisUtil.getById(id, bmClassroomMapper));
    }

    @Override
    public IPage<BmClassroomDTO> page(BmClassroomQuery query) {
        return bmClassroomMapper.page(query, query.build());
    }
}