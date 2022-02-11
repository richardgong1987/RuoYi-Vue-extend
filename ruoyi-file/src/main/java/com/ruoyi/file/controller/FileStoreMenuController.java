package com.ruoyi.file.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.file.domain.FileStoreMenu;
import com.ruoyi.file.service.IFileStoreMenuService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 菜单权限Controller
 * 
 * @author ruoyi
 * @date 2022-02-11
 */
@RestController
@RequestMapping("/material/fileDrive")
public class FileStoreMenuController extends BaseController
{
    @Autowired
    private IFileStoreMenuService fileStoreMenuService;

    /**
     * 查询菜单权限列表
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:list')")
    @GetMapping("/list")
    public TableDataInfo list(FileStoreMenu fileStoreMenu)
    {
        startPage();
        List<FileStoreMenu> list = fileStoreMenuService.selectFileStoreMenuList(fileStoreMenu);
        return getDataTable(list);
    }

    /**
     * 导出菜单权限列表
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:export')")
    @Log(title = "菜单权限", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileStoreMenu fileStoreMenu)
    {
        List<FileStoreMenu> list = fileStoreMenuService.selectFileStoreMenuList(fileStoreMenu);
        ExcelUtil<FileStoreMenu> util = new ExcelUtil<FileStoreMenu>(FileStoreMenu.class);
        util.exportExcel(response, list, "菜单权限数据");
    }

    /**
     * 获取菜单权限详细信息
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:query')")
    @GetMapping(value = "/{menuId}")
    public AjaxResult getInfo(@PathVariable("menuId") Long menuId)
    {
        return AjaxResult.success(fileStoreMenuService.selectFileStoreMenuByMenuId(menuId));
    }

    /**
     * 新增菜单权限
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:add')")
    @Log(title = "菜单权限", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileStoreMenu fileStoreMenu)
    {
        return toAjax(fileStoreMenuService.insertFileStoreMenu(fileStoreMenu));
    }

    /**
     * 修改菜单权限
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:edit')")
    @Log(title = "菜单权限", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileStoreMenu fileStoreMenu)
    {
        return toAjax(fileStoreMenuService.updateFileStoreMenu(fileStoreMenu));
    }

    /**
     * 删除菜单权限
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:remove')")
    @Log(title = "菜单权限", businessType = BusinessType.DELETE)
	@DeleteMapping("/{menuIds}")
    public AjaxResult remove(@PathVariable Long[] menuIds)
    {
        return toAjax(fileStoreMenuService.deleteFileStoreMenuByMenuIds(menuIds));
    }
}
