package com.ruoyi.file.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.file.mapper.FileStoreMappingMapper;
import com.ruoyi.file.domain.FileStoreMapping;
import com.ruoyi.file.service.IFileStoreMappingService;

/**
 * 文件关系Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-02-11
 */
@Service
public class FileStoreMappingServiceImpl implements IFileStoreMappingService 
{
    @Autowired
    private FileStoreMappingMapper fileStoreMappingMapper;

    /**
     * 查询文件关系
     * 
     * @param id 文件关系主键
     * @return 文件关系
     */
    @Override
    public FileStoreMapping selectFileStoreMappingById(Long id)
    {
        return fileStoreMappingMapper.selectFileStoreMappingById(id);
    }

    /**
     * 查询文件关系列表
     * 
     * @param fileStoreMapping 文件关系
     * @return 文件关系
     */
    @Override
    public List<FileStoreMapping> selectFileStoreMappingList(FileStoreMapping fileStoreMapping)
    {
        return fileStoreMappingMapper.selectFileStoreMappingList(fileStoreMapping);
    }

    /**
     * 新增文件关系
     * 
     * @param fileStoreMapping 文件关系
     * @return 结果
     */
    @Override
    public int insertFileStoreMapping(FileStoreMapping fileStoreMapping)
    {
        fileStoreMapping.setCreateTime(DateUtils.getNowDate());
        return fileStoreMappingMapper.insertFileStoreMapping(fileStoreMapping);
    }

    /**
     * 修改文件关系
     * 
     * @param fileStoreMapping 文件关系
     * @return 结果
     */
    @Override
    public int updateFileStoreMapping(FileStoreMapping fileStoreMapping)
    {
        fileStoreMapping.setUpdateTime(DateUtils.getNowDate());
        return fileStoreMappingMapper.updateFileStoreMapping(fileStoreMapping);
    }

    /**
     * 批量删除文件关系
     * 
     * @param ids 需要删除的文件关系主键
     * @return 结果
     */
    @Override
    public int deleteFileStoreMappingByIds(Long[] ids)
    {
        return fileStoreMappingMapper.deleteFileStoreMappingByIds(ids);
    }

    /**
     * 删除文件关系信息
     * 
     * @param id 文件关系主键
     * @return 结果
     */
    @Override
    public int deleteFileStoreMappingById(Long id)
    {
        return fileStoreMappingMapper.deleteFileStoreMappingById(id);
    }
}
