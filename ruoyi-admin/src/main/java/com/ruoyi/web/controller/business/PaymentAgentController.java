package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.dto.DeleteDTO;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.PaymentAgent;
import com.ruoyi.business.service.IPaymentAgentService;
import com.ruoyi.common.core.page.TableDataInfo;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 代缴学费Controller
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
@RestController
@RequestMapping("/business/agent")
public class PaymentAgentController extends BaseController
{
    @Autowired
    private IPaymentAgentService paymentAgentService;


    /**
     * 查询注册用户的交费列表
     */
    @PreAuthorize("@ss.hasPermi('business:agent:byCreateId')")
    @GetMapping("/byCreateId")
    public TableDataInfo byCreateId(PaymentAgent paymentAgent)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        paymentAgent.setCreateId(user.getUserId());
        startPage();
        List<PaymentAgent> list = paymentAgentService.selectPaymentAgentList(paymentAgent);
        return getDataTable(list);
    }

    /**
     * 查询代缴学费列表
     */
    @PreAuthorize("@ss.hasPermi('business:agent:list')")
    @GetMapping("/list")
    public TableDataInfo list(PaymentAgent paymentAgent)
    {
        startPage();
        List<PaymentAgent> list = paymentAgentService.selectPaymentAgentList(paymentAgent);
        return getDataTable(list);
    }

    /**
     * 获取代缴学费详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:agent:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(paymentAgentService.selectPaymentAgentById(id));
    }

    /**
     * 新增代缴学费
     */
    @PreAuthorize("@ss.hasPermi('business:agent:add')")
    @Log(title = "新增代缴学费", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody PaymentAgent paymentAgent)
    {
        return toAjax(paymentAgentService.insertPaymentAgent(paymentAgent));
    }

    /**
     * 修改代缴学费
     */
    @PreAuthorize("@ss.hasPermi('business:agent:edit')")
    @Log(title = "修改代缴学费", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody PaymentAgent paymentAgent)
    {
        return toAjax(paymentAgentService.updatePaymentAgent(paymentAgent));
    }

    /**
     * 删除代缴学费
     */
    @PreAuthorize("@ss.hasPermi('business:agent:remove')")
    @Log(title = "删除代缴学费", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        if (dto.getIdList() == null || dto.getIdList().size() == 0) {
            return error("请选择要删除的数据");
        }

        return toAjax(paymentAgentService.deletePaymentAgentByIds(dto.getIdList()));
    }
}
