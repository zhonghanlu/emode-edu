package com.mini.biz.app.business;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mini.common.enums.str.PosterType;
import com.mini.manager.service.BmPosterService;
import com.mini.manager.service.BmProductService;
import com.mini.pojo.mapper.operate.BmPosterStructMapper;
import com.mini.pojo.mapper.sale.BmProductStructMapper;
import com.mini.pojo.model.dto.operate.BmPosterDTO;
import com.mini.pojo.model.dto.sale.BmProductAppDTO;
import com.mini.pojo.model.dto.sale.BmProductDTO;
import com.mini.pojo.model.query.sale.BmProductAppQuery;
import com.mini.pojo.model.vo.operate.BmPosterVo;
import com.mini.pojo.model.vo.sale.BmProductAppDetailVo;
import com.mini.pojo.model.vo.sale.BmProductAppVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author zhl
 * @create 2025/3/18 16:05
 */
@Component
@RequiredArgsConstructor
public class AppCourseBiz {

    private final BmPosterService bmPosterService;

    private final BmProductService bmProductService;

    /**
     * 课程页轮播图 与主页轮播图 汇成一个通用接口
     */
    public List<BmPosterVo> coursePoster() {
        List<BmPosterDTO> bmPosterDTOList = bmPosterService.getDefaultPoster(PosterType.MINI_HOME_PAGE, 4);
        return BmPosterStructMapper.INSTANCE.dtoList2VoList(bmPosterDTOList);
    }

    /**
     * 课程页查询课程信息
     */
    public IPage<BmProductAppVo> courseInfo(BmProductAppQuery query) {
        IPage<BmProductAppDTO> bmProductAppDTOPage = bmProductService.pageForApp(query);
        return bmProductAppDTOPage.convert(BmProductStructMapper.INSTANCE::appDto2Vo);
    }

    /**
     * 课程详细信息
     */
    public BmProductAppDetailVo productAppDetailVo(Long productId) {
        BmProductDTO bmProductDTO = bmProductService.selectById(productId);
        return BmProductStructMapper.INSTANCE.appDto2DetailVo(bmProductDTO);
    }

    /**
     * 课程支付
     */
}
