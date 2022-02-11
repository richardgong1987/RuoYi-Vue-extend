package com.ruoyi.file.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.file.domain.FileStoreMapping;
import com.ruoyi.file.service.IFileStoreMappingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 文件关系Controller
 *
 * @author ruoyi
 * @date 2022-02-11
 */
@RestController
@RequestMapping("/file/mapping")
public class FileStoreMappingController extends BaseController {
    @Autowired
    private IFileStoreMappingService fileStoreMappingService;

    /**
     * 查询文件关系列表
     */
    @GetMapping("/list")
    public AjaxResult list(FileStoreMapping fileStoreMapping) {
        List<FileStoreMapping> list = fileStoreMappingService.selectFileStoreMappingList(fileStoreMapping);
        return AjaxResult.success(list);
    }


    /**
     * 获取文件关系详细信息
     */
    @PreAuthorize("@ss.hasPermi('file:mapping:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(fileStoreMappingService.selectFileStoreMappingById(id));
    }

    /**
     * 新增文件关系
     */
    @PreAuthorize("@ss.hasPermi('file:mapping:add')")
    @Log(title = "文件关系", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileStoreMapping fileStoreMapping) {
        return toAjax(fileStoreMappingService.insertFileStoreMapping(fileStoreMapping));
    }

    /**
     * 修改文件关系
     */
    @PreAuthorize("@ss.hasPermi('file:mapping:edit')")
    @Log(title = "文件关系", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileStoreMapping fileStoreMapping) {
        return toAjax(fileStoreMappingService.updateFileStoreMapping(fileStoreMapping));
    }

    /**
     * 删除文件关系
     */
    @PreAuthorize("@ss.hasPermi('file:mapping:remove')")
    @Log(title = "文件关系", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(fileStoreMappingService.deleteFileStoreMappingByIds(ids));
    }
}
