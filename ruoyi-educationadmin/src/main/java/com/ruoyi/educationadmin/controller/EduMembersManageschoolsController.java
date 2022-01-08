package com.ruoyi.educationadmin.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.educationadmin.domain.EduMembersManageschools;
import com.ruoyi.educationadmin.service.IEduMembersManageschoolsService;
import com.ruoyi.educationadmin.utils.BizUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 学校管理Controller
 *
 * @author richard
 * @date 2021-12-30
 */
@RestController
@RequestMapping("/peoples/managementSchools")
public class EduMembersManageschoolsController extends BaseController
{
    @Autowired
    private IEduMembersManageschoolsService eduMembersManageschoolsService;

    /**
     * 查询学校管理列表
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementSchools:list')")
    @GetMapping("/list")
    public TableDataInfo list(EduMembersManageschools eduMembersManageschools)
    {
        startPage();
        List<EduMembersManageschools> list = eduMembersManageschoolsService.selectEduMembersManageschoolsList(eduMembersManageschools);
        return getDataTable(list);
    }
    @GetMapping("/dict")
    public AjaxResult listDict() throws InvocationTargetException, NoSuchMethodException, IllegalAccessException {
        List<EduMembersManageschools> ret = eduMembersManageschoolsService.selectEduMembersManageschoolsList(new EduMembersManageschools());
        return AjaxResult.success(BizUtils.toSysDictData(ret));
    }

    /**
     * 导出学校管理列表
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementSchools:export')")
    @Log(title = "学校管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduMembersManageschools eduMembersManageschools) {
        List<EduMembersManageschools> list = eduMembersManageschoolsService.selectEduMembersManageschoolsList(eduMembersManageschools);
        ExcelUtil<EduMembersManageschools> util = new ExcelUtil<EduMembersManageschools>(EduMembersManageschools.class);
        util.exportExcel(response, list, "学校管理数据");
    }

    /**
     * 获取学校管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementSchools:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(eduMembersManageschoolsService.selectEduMembersManageschoolsById(id));
    }

    /**
     * 新增学校管理
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementSchools:add')")
    @Log(title = "学校管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduMembersManageschools eduMembersManageschools) {
        return toAjax(eduMembersManageschoolsService.insertEduMembersManageschools(eduMembersManageschools));
    }

    /**
     * 修改学校管理
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementSchools:edit')")
    @Log(title = "学校管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduMembersManageschools eduMembersManageschools) {
        return toAjax(eduMembersManageschoolsService.updateEduMembersManageschools(eduMembersManageschools));
    }

    /**
     * 删除学校管理
     */
    @PreAuthorize("@ss.hasPermi('peoples:managementSchools:remove')")
    @Log(title = "学校管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(eduMembersManageschoolsService.deleteEduMembersManageschoolsByIds(ids));
    }
}
