package com.ruoyi.file.service;

import java.util.List;
import com.ruoyi.file.domain.FileStoreMapping;

/**
 * 文件关系Service接口
 * 
 * @author ruoyi
 * @date 2022-02-11
 */
public interface IFileStoreMappingService 
{
    /**
     * 查询文件关系
     * 
     * @param id 文件关系主键
     * @return 文件关系
     */
    public FileStoreMapping selectFileStoreMappingById(Long id);

    /**
     * 查询文件关系列表
     * 
     * @param fileStoreMapping 文件关系
     * @return 文件关系集合
     */
    public List<FileStoreMapping> selectFileStoreMappingList(FileStoreMapping fileStoreMapping);

    /**
     * 新增文件关系
     * 
     * @param fileStoreMapping 文件关系
     * @return 结果
     */
    public int insertFileStoreMapping(FileStoreMapping fileStoreMapping);

    /**
     * 修改文件关系
     * 
     * @param fileStoreMapping 文件关系
     * @return 结果
     */
    public int updateFileStoreMapping(FileStoreMapping fileStoreMapping);

    /**
     * 批量删除文件关系
     * 
     * @param ids 需要删除的文件关系主键集合
     * @return 结果
     */
    public int deleteFileStoreMappingByIds(Long[] ids);

    /**
     * 删除文件关系信息
     * 
     * @param id 文件关系主键
     * @return 结果
     */
    public int deleteFileStoreMappingById(Long id);
}
