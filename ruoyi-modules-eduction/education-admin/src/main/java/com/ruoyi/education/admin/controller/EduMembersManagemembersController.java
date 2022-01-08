package com.ruoyi.education.admin.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.education.admin.domain.EduMembersManagemembers;
import com.ruoyi.education.admin.service.IEduMembersManagemembersService;
import com.ruoyi.common.core.controller.BaseController;

/**
 * 会员管理Controller
 *
 * @author richard
 * @date 2021-12-31
 */
@RestController
@RequestMapping("/peoples/managementMemberships")
public class EduMembersManagemembersController extends BaseController
{
    @Autowired
    private IEduMembersManagemembersService eduMembersManagemembersService;

    /**
     * 查询会员管理列表
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementMemberships:list')")
    @GetMapping("/list")
    public TableDataInfo list(EduMembersManagemembers eduMembersManagemembers)
    {
        startPage();
        List<EduMembersManagemembers> list = eduMembersManagemembersService.selectEduMembersManagemembersList(eduMembersManagemembers);
        return getDataTable(list);
    }

    /**
     * 导出会员管理列表
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementMemberships:export')")
    @Log(title = "会员管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduMembersManagemembers eduMembersManagemembers)
    {
        List<EduMembersManagemembers> list = eduMembersManagemembersService.selectEduMembersManagemembersList(eduMembersManagemembers);
        ExcelUtil<EduMembersManagemembers> util = new ExcelUtil<EduMembersManagemembers>(EduMembersManagemembers.class);
        util.exportExcel(response, list, "会员管理数据");
    }

    /**
     * 获取会员管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementMemberships:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(eduMembersManagemembersService.selectEduMembersManagemembersById(id));
    }

    /**
     * 新增会员管理
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementMemberships:add')")
    @Log(title = "会员管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduMembersManagemembers eduMembersManagemembers)
    {
        return toAjax(eduMembersManagemembersService.insertEduMembersManagemembers(eduMembersManagemembers));
    }

    /**
     * 修改会员管理
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementMemberships:edit')")
    @Log(title = "会员管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduMembersManagemembers eduMembersManagemembers)
    {
        return toAjax(eduMembersManagemembersService.updateEduMembersManagemembers(eduMembersManagemembers));
    }

    /**
     * 删除会员管理
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementMemberships:remove')")
    @Log(title = "会员管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(eduMembersManagemembersService.deleteEduMembersManagemembersByIds(ids));
    }
}
