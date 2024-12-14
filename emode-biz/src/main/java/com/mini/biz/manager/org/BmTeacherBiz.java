package com.mini.biz.manager.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.auth.model.dto.AuthUserDTO;
import com.mini.auth.service.IAuthUserService;
import com.mini.base.service.ISysConfigService;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.str.UserType;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.common.utils.SmCryptoUtil;
import com.mini.common.utils.webmvc.IDGenerator;
import com.mini.file.model.dto.SysFileDTO;
import com.mini.file.service.ISysFileService;
import com.mini.manager.service.BmTeacherService;
import com.mini.manager.service.BmUserTeacherService;
import com.mini.pojo.entity.org.BmUserTeacher;
import com.mini.pojo.mapper.org.BmTeacherStructMapper;
import com.mini.pojo.model.dto.org.BmTeacherDTO;
import com.mini.pojo.model.edit.org.BmTeacherEdit;
import com.mini.pojo.model.query.org.BmTeacherQuery;
import com.mini.pojo.model.request.org.BmTeacherRequest;
import com.mini.pojo.model.vo.org.BmTeacherVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

import static com.mini.common.constant.RedisConstant.SYS_CONFIG_INIT_PASSWORD;

/**
 * @author zhl
 * @create 2024/11/12 17:18
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmTeacherBiz {

    private final BmTeacherService bmTeacherService;

    private final ISysFileService sysFileService;

    private final BmUserTeacherService bmUserTeacherService;

    private final IAuthUserService authUserService;

    private final ISysConfigService sysConfigService;

    /**
     * 分页
     */
    public IPage<BmTeacherVo> page(BmTeacherQuery query) {
        IPage<BmTeacherDTO> page = bmTeacherService.page(query);
        return page.convert(BmTeacherStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmTeacherVo getEntityById(Long id) {
        BmTeacherDTO bmTeacherDTO = bmTeacherService.selectById(id);

        if (Objects.isNull(bmTeacherDTO)) {
            return null;
        }

        SysFileDTO sysFileDTO = sysFileService.getById(bmTeacherDTO.getTeaAvatarId());

        if (Objects.nonNull(sysFileDTO)) {
            bmTeacherDTO.setTeaAvatarUrl(sysFileDTO.getFileUrl());
        }


        return BmTeacherStructMapper.INSTANCE.dto2Vo(bmTeacherDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmTeacherRequest request) {
        // 1.新增教师
        BmTeacherDTO bmTeacherDTO = bmTeacherService.add(BmTeacherStructMapper.INSTANCE.req2Dto(request));

        // 2.新增账户信息
        AuthUserDTO authUserDTO = new AuthUserDTO();
        authUserDTO.setId(IDGenerator.next());
        authUserDTO.setUsername(bmTeacherDTO.getTeaPhone());
        authUserDTO.setPassword(SmCryptoUtil.doHashValue(sysConfigService.searchByKey(SYS_CONFIG_INIT_PASSWORD)));
        authUserDTO.setNickname(bmTeacherDTO.getTeaName());
        authUserDTO.setSex(bmTeacherDTO.getSex());
        authUserDTO.setAvatar(bmTeacherDTO.getTeaAvatarId());
        authUserDTO.setAvatarUrl(bmTeacherDTO.getTeaAvatarUrl());
        authUserDTO.setPhone(bmTeacherDTO.getTeaPhone());
        authUserDTO.setUserType(UserType.MANAGER);
        authUserService.insert(authUserDTO);

        // 3.新增教师与账户关联关系
        BmUserTeacher bmUserTeacher = new BmUserTeacher();
        bmUserTeacher.setId(IDGenerator.next());
        bmUserTeacher.setTeaId(bmTeacherDTO.getId());
        bmUserTeacher.setUserId(authUserDTO.getId());

        boolean b = bmUserTeacherService.save(bmUserTeacher);

        if (!b) {
            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "新增教师与账户关联关系失败");
        }

    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmTeacherService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmTeacherEdit edit) {
        bmTeacherService.update(BmTeacherStructMapper.INSTANCE.edit2Dto(edit));
    }
}
