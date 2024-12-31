package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.vo.CarouselListVO;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.CarouselMapper;
import com.ruoyi.business.domain.Carousel;
import com.ruoyi.business.service.ICarouselService;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 轮播图Service业务层处理
 * 
 * @author tangJM.
 * @date 2024-12-31
 */
@Service
public class CarouselServiceImpl implements ICarouselService 
{
    @Autowired
    private CarouselMapper carouselMapper;

    /**
     * 查询轮播图
     * 
     * @param id 轮播图主键
     * @return 轮播图
     */
    @Override
    public Carousel selectCarouselById(Long id)
    {
        return carouselMapper.selectCarouselById(id);
    }

    /**
     * 查询轮播图列表
     * 
     * @param carousel 轮播图
     * @return 轮播图
     */
    @Override
    public List<CarouselListVO> selectCarouselList(Carousel carousel)
    {
        return carouselMapper.selectCarouselList(carousel);
    }

    /**
     * 新增轮播图
     * 
     * @param carousel 轮播图
     * @return 结果
     */
    @Override
    public int insertCarousel(Carousel carousel)
    {
        carousel.setCreateTime(DateUtils.getNowDate());
        return carouselMapper.insertCarousel(carousel);
    }

    /**
     * 修改轮播图
     * 
     * @param carousel 轮播图
     * @return 结果
     */
    @Override
    public int updateCarousel(Carousel carousel)
    {
        carousel.setUpdateTime(DateUtils.getNowDate());
        return carouselMapper.updateCarousel(carousel);
    }

    /**
     * 批量删除轮播图
     * 
     * @param idList 需要删除的轮播图主键
     * @return 结果
     */
    @Override
    public int deleteCarouselByIds(List<Integer> idList)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        return carouselMapper.deleteCarouselByIds(idList, user.getUserName());
    }

    /**
     * 删除轮播图信息
     * 
     * @param id 轮播图主键
     * @return 结果
     */
    @Override
    public int deleteCarouselById(Long id)
    {
        return carouselMapper.deleteCarouselById(id);
    }
}
