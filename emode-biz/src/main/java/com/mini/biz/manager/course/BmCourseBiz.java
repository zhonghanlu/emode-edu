package com.mini.biz.manager.course;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.mini.common.constant.ErrorCodeConstant;
import com.mini.common.enums.number.Delete;
import com.mini.common.exception.service.EModeServiceException;
import com.mini.manager.service.BmCourseService;
import com.mini.manager.service.BmCourseStuSignService;
import com.mini.pojo.entity.course.BmCourseStuSign;
import com.mini.pojo.mapper.course.BmCourseStructMapper;
import com.mini.pojo.model.dto.course.BmCourseDTO;
import com.mini.pojo.model.edit.course.BmCourseEdit;
import com.mini.pojo.model.edit.course.BmCourseStuClassNotesEdit;
import com.mini.pojo.model.edit.course.BmCourseStuClassPicEdit;
import com.mini.pojo.model.edit.course.BmCourseStuSignEdit;
import com.mini.pojo.model.query.course.BmCourseQuery;
import com.mini.pojo.model.request.course.BmCourseRequest;
import com.mini.pojo.model.vo.course.BmCourseVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Valid;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author zhl
 * @create 2024/11/20 13:41
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BmCourseBiz {


    private final BmCourseService bmCourseService;

    private final BmCourseStuSignService bmCourseStuSignService;

    /**
     * 分页
     */
    public IPage<BmCourseVo> page(BmCourseQuery query) {
        IPage<BmCourseDTO> page = bmCourseService.page(query);
        return page.convert(BmCourseStructMapper.INSTANCE::dto2Vo);
    }

    /**
     * 获取当条机构详情
     */
    public BmCourseVo getEntityById(Long id) {
        BmCourseDTO bmCourseDTO = bmCourseService.selectById(id);
        return BmCourseStructMapper.INSTANCE.dto2Vo(bmCourseDTO);
    }

    /**
     * 新增机构信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void insert(BmCourseRequest request) {
        bmCourseService.add(BmCourseStructMapper.INSTANCE.req2Dto(request));
    }

    /**
     * 删除单条信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void del(long id) {
        bmCourseService.del(id);
    }

    /**
     * 修改信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(BmCourseEdit edit) {
        bmCourseService.update(BmCourseStructMapper.INSTANCE.edit2Dto(edit));
    }

    /**
     * 学生上课签到
     */
    @Transactional(rollbackFor = Exception.class)
    public void stuSignIn(BmCourseStuSignEdit edit) {
        Long courseId = edit.getCourseId();
        BmCourseDTO bmCourseDTO = bmCourseService.selectById(courseId);
        if (Objects.isNull(bmCourseDTO)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "课程信息有误,请重新选择");
        }

        List<BmCourseStuSignEdit.StuSignStatusInfo> stuSignStatusInfoList = edit.getStuSignStatusInfoList();

        if (CollectionUtils.isEmpty(stuSignStatusInfoList)) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "签到信息不可为空");
        }

        LambdaQueryWrapper<BmCourseStuSign> wrapper = Wrappers.lambdaQuery(BmCourseStuSign.class);
        wrapper.in(BmCourseStuSign::getStuId, stuSignStatusInfoList
                        .stream()
                        .map(BmCourseStuSignEdit.StuSignStatusInfo::getStuId)
                        .collect(Collectors.toList()))
                .eq(BmCourseStuSign::getCourseId, courseId)
                .eq(BmCourseStuSign::getDelFlag, Delete.NO);

        List<BmCourseStuSign> bmCourseStuSignList = bmCourseStuSignService.list(wrapper);

        if (bmCourseStuSignList.size() != stuSignStatusInfoList.size()) {
            throw new EModeServiceException(ErrorCodeConstant.PARAM_ERROR, "签到信息有误,请重新选择");
        }

//        int b1 = bmCourseStuSignService.batchUpdate(courseId, stuSignStatusInfoList);
//
//        if (b1 <= 0) {
//            throw new EModeServiceException(ErrorCodeConstant.DB_ERROR, "签到信息入库失败");
//        }
    }

    /**
     * 学生课中情况
     */
    public void stuClassPic(BmCourseStuClassPicEdit edit) {

    }

    /**
     * 课堂讲义与作业
     */
    public void stuClassNotes(BmCourseStuClassNotesEdit edit) {

    }
}
