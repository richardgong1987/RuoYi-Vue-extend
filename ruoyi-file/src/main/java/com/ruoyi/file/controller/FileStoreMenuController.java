package com.ruoyi.file.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.file.domain.FileStoreMapping;
import com.ruoyi.file.domain.FileStoreMenu;
import com.ruoyi.file.service.IFileStoreMappingService;
import com.ruoyi.file.service.IFileStoreMenuService;
import com.ruoyi.file.service.ISysFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 目录权限Controller
 *
 * @author ruoyi
 * @date 2022-02-11
 */
@RestController
@RequestMapping("/material/fileDrive")
public class FileStoreMenuController extends BaseController {

    @Autowired
    private IFileStoreMenuService menuService;

    /**
     * 获取目录列表
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:list')")
    @GetMapping("/list")
    public AjaxResult list(FileStoreMenu menu) {
        List<FileStoreMenu> menus = menuService.selectMenuList(menu, getUserId());
        return AjaxResult.success(menus);
    }

    /**
     * 根据目录编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:query')")
    @GetMapping(value = "/{menuId}")
    public AjaxResult getInfo(@PathVariable Long menuId) {
        return AjaxResult.success(menuService.selectMenuById(menuId));
    }

    /**
     * 获取目录下拉树列表
     */
    @GetMapping("/treeselect")
    public AjaxResult treeselect(FileStoreMenu menu) {
        List<FileStoreMenu> menus = menuService.selectMenuList(menu, getUserId());
        return AjaxResult.success(menuService.buildMenuTreeSelect(menus));
    }

    /**
     * 加载对应角色目录列表树
     */
    @GetMapping(value = "/roleMenuTreeselect/{roleId}")
    public AjaxResult roleMenuTreeselect(@PathVariable("roleId") Long roleId) {
        List<FileStoreMenu> menus = menuService.selectMenuList(getUserId());
        AjaxResult ajax = AjaxResult.success();
        ajax.put("checkedKeys", menuService.selectMenuListByRoleId(roleId));
        ajax.put("menus", menuService.buildMenuTreeSelect(menus));
        return ajax;
    }

    /**
     * 新增目录
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:add')")
    @Log(title = "目录管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody FileStoreMenu menu) {
        if (UserConstants.NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu))) {
            return AjaxResult.error("新增目录'" + menu.getMenuName() + "'失败，目录名称已存在");
        } else if (UserConstants.YES_FRAME.equals(menu.getIsFrame()) && !StringUtils.ishttp(menu.getPath())) {
            return AjaxResult.error("新增目录'" + menu.getMenuName() + "'失败，地址必须以http(s)://开头");
        }
        return toAjax(menuService.insertMenu(menu));
    }

    /**
     * 修改目录
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:edit')")
    @Log(title = "目录管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody FileStoreMenu menu) {
        if (UserConstants.NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu))) {
            return AjaxResult.error("修改目录'" + menu.getMenuName() + "'失败，目录名称已存在");
        } else if (UserConstants.YES_FRAME.equals(menu.getIsFrame()) && !StringUtils.ishttp(menu.getPath())) {
            return AjaxResult.error("修改目录'" + menu.getMenuName() + "'失败，地址必须以http(s)://开头");
        } else if (menu.getMenuId().equals(menu.getParentId())) {
            return AjaxResult.error("修改目录'" + menu.getMenuName() + "'失败，上级目录不能选择自己");
        }
        menu.setUpdateBy(getUsername());
        return toAjax(menuService.updateMenu(menu));
    }

    /**
     * 删除目录
     */
    @PreAuthorize("@ss.hasPermi('material:fileDrive:remove')")
    @Log(title = "目录管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{menuId}")
    @Transactional
    public AjaxResult remove(@PathVariable("menuId") Long menuId) throws Exception {
        if (menuService.hasChildByMenuId(menuId)) {
            return AjaxResult.error("存在子目录,不允许删除");
        }
        if (menuService.checkMenuExistRole(menuId)) {
            return AjaxResult.error("目录已分配,不允许删除");
        }
        int i = menuService.deleteMenuById(menuId);
        var fileStoreMapping = new FileStoreMapping();
        fileStoreMapping.setMenuId(menuId);
        var fileStoreMappings = fileStoreMappingService.selectFileStoreMappingList(fileStoreMapping);
        ArrayList<Long> ids = new ArrayList<>();
        for (FileStoreMapping storeMapping : fileStoreMappings) {
            iSysFileService.deleteFile(storeMapping.getUrl());
            ids.add(storeMapping.getId());
        }
        Long[] longs = ids.toArray(new Long[]{});
        if (longs.length > 0) {
            fileStoreMappingService.deleteFileStoreMappingByIds(longs);
        }
        return toAjax(i);
    }

    @Autowired
    ISysFileService iSysFileService;
    @Autowired
    private IFileStoreMappingService fileStoreMappingService;

}
