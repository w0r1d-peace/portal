package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.Carousel;
import com.ruoyi.business.domain.vo.CarouselListVO;
import org.apache.ibatis.annotations.Param;

/**
 * 轮播图Mapper接口
 * 
 * @author tangJM.
 * @date 2024-12-31
 */
public interface CarouselMapper 
{
    /**
     * 查询轮播图
     * 
     * @param id 轮播图主键
     * @return 轮播图
     */
    public Carousel selectCarouselById(Long id);

    /**
     * 查询轮播图列表
     * 
     * @param carousel 轮播图
     * @return 轮播图集合
     */
    public List<CarouselListVO> selectCarouselList(Carousel carousel);

    /**
     * 新增轮播图
     * 
     * @param carousel 轮播图
     * @return 结果
     */
    public int insertCarousel(Carousel carousel);

    /**
     * 修改轮播图
     * 
     * @param carousel 轮播图
     * @return 结果
     */
    public int updateCarousel(Carousel carousel);

    /**
     * 删除轮播图
     * 
     * @param id 轮播图主键
     * @return 结果
     */
    public int deleteCarouselById(Long id);

    /**
     * 批量删除轮播图
     * 
     * @param idList 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCarouselByIds(@Param("idList") List<Integer> idList, @Param("updateBy") String updateBy);
}
