package com.ruoyi.file.mapper;

import java.util.List;
import com.ruoyi.file.domain.FileStoreMapping;

/**
 * 文件关系Mapper接口
 * 
 * @author ruoyi
 * @date 2022-02-11
 */
public interface FileStoreMappingMapper 
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
     * 删除文件关系
     * 
     * @param id 文件关系主键
     * @return 结果
     */
    public int deleteFileStoreMappingById(Long id);

    /**
     * 批量删除文件关系
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFileStoreMappingByIds(Long[] ids);
}
