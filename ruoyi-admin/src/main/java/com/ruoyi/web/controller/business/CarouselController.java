package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.dto.DeleteDTO;
import com.ruoyi.business.domain.vo.CarouselListVO;
import com.ruoyi.common.exception.ServiceException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.Carousel;
import com.ruoyi.business.service.ICarouselService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 轮播图Controller
 * 
 * @author tangJM.
 * @date 2024-12-31
 */
@RestController
@RequestMapping("/business/carousel")
public class CarouselController extends BaseController
{
    @Autowired
    private ICarouselService carouselService;

    /**
     * 查询轮播图列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Carousel carousel)
    {
        startPage();
        List<CarouselListVO> list = carouselService.selectCarouselList(carousel);
        return getDataTable(list);
    }

    /**
     * 新增轮播图
     */
    @PreAuthorize("@ss.hasPermi('business:carousel:add')")
    @Log(title = "新增轮播图", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody Carousel carousel)
    {
        return toAjax(carouselService.insertCarousel(carousel));
    }

    /**
     * 修改轮播图
     */
    @PreAuthorize("@ss.hasPermi('business:carousel:edit')")
    @Log(title = "修改轮播图", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody Carousel carousel)
    {
        return toAjax(carouselService.updateCarousel(carousel));
    }

    /**
     * 删除轮播图
     */
    @PreAuthorize("@ss.hasPermi('business:carousel:remove')")
    @Log(title = "删除轮播图", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        if (dto == null || dto.getIdList().isEmpty()) {
            throw new ServiceException("请选择要删除的数据");
        }

        return toAjax(carouselService.deleteCarouselByIds(dto.getIdList()));
    }
}
