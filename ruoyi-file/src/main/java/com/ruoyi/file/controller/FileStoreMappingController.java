package com.ruoyi.file.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.file.domain.FileStoreMapping;
import com.ruoyi.file.service.IFileStoreMappingService;
import com.ruoyi.file.service.ISysFileService;
import io.minio.Result;
import io.minio.messages.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
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
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(fileStoreMappingService.selectFileStoreMappingById(id));
    }

    /**
     * 新增文件关系
     */
    @Log(title = "文件关系", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileStoreMapping fileStoreMapping) {
        return toAjax(fileStoreMappingService.insertFileStoreMapping(fileStoreMapping));
    }

    /**
     * 修改文件关系
     */
    @Log(title = "文件关系", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileStoreMapping fileStoreMapping) {
        return toAjax(fileStoreMappingService.updateFileStoreMapping(fileStoreMapping));
    }

    /**
     * 删除文件关系
     */
    @Log(title = "文件关系", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    @Transactional
    public AjaxResult remove(@PathVariable Long[] ids) throws Exception {
        for (Long id : ids) {
            var fileStoreMapping = fileStoreMappingService.selectFileStoreMappingById(id);
            String url = fileStoreMapping.getUrl();
            if (StringUtils.isNotEmpty(url)) {
                iSysFileService.deleteFile(url);
            }
        }
        int i = fileStoreMappingService.deleteFileStoreMappingByIds(ids);
        return toAjax(i);
    }

    @Autowired
    ISysFileService iSysFileService;

    /**
     * 删除文件关系
     */
    @Log(title = "文件关系", businessType = BusinessType.OTHER)
    @GetMapping("/listObjects")
    @Transactional
    public AjaxResult listObjects(String userId, String relativePath) throws Exception {
        var  results = iSysFileService.listFile(userId, relativePath);
        return AjaxResult.success(results);
    }

    /**
     * 删除文件关系
     */
    @Log(title = "文件关系", businessType = BusinessType.OTHER)
    @DeleteMapping ("/listObjects/delete")
    @Transactional
    public AjaxResult listObjectsDelete(String userId, String relativePath) throws Exception {
        var  results = iSysFileService.deleteFileList(userId, relativePath);
        return AjaxResult.success(results);
    }

}
