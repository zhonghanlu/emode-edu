package com.mini.manager.sale;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mini.biz.manager.sale.BmProductBiz;
import com.mini.pojo.model.query.sale.BmProductQuery;
import com.mini.pojo.model.vo.sale.BmProductVo;
import com.mini.web.ModeApplication;
import com.mini.web.controller.manager.sale.BmProductController;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.Collections;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * @Author : zhl
 * @Date: 2024/12/3 19:54
 * @Description:
 */
@SpringBootTest(classes = ModeApplication.class)
public class TestMockProduct {

    private MockMvc mockMvc;

    @Mock
    private BmProductBiz bmProductBiz;

    @InjectMocks
    private BmProductController bmProductController;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(bmProductController).build();
    }

    @Test
    public void page_ValidQuery_ReturnsPageData() throws Exception {
        // Arrange
        BmProductQuery query = new BmProductQuery();
        query.setPageNum(1);
        query.setPageSize(10);

        IPage<BmProductVo> bmProductVoPage = new Page<>(1, 10);
        bmProductVoPage.setRecords(Collections.singletonList(new BmProductVo()));
        when(bmProductBiz.page(any(BmProductQuery.class))).thenReturn(bmProductVoPage);

        // Act & Assert
        mockMvc.perform(get("/bm-product/page")
                        .param("pageNum", "1")
                        .param("pageSize", "10"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(200))
                .andExpect(jsonPath("$.data.current").value(1))
                .andExpect(jsonPath("$.data.size").value(10))
                .andExpect(jsonPath("$.data.records").isArray());
    }

}
