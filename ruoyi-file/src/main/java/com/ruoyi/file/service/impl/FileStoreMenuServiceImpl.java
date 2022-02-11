package com.ruoyi.file.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.file.mapper.FileStoreMenuMapper;
import com.ruoyi.file.domain.FileStoreMenu;
import com.ruoyi.file.service.IFileStoreMenuService;

/**
 * 菜单权限Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-02-11
 */
@Service
public class FileStoreMenuServiceImpl implements IFileStoreMenuService 
{
    @Autowired
    private FileStoreMenuMapper fileStoreMenuMapper;

    /**
     * 查询菜单权限
     * 
     * @param menuId 菜单权限主键
     * @return 菜单权限
     */
    @Override
    public FileStoreMenu selectFileStoreMenuByMenuId(Long menuId)
    {
        return fileStoreMenuMapper.selectFileStoreMenuByMenuId(menuId);
    }

    /**
     * 查询菜单权限列表
     * 
     * @param fileStoreMenu 菜单权限
     * @return 菜单权限
     */
    @Override
    public List<FileStoreMenu> selectFileStoreMenuList(FileStoreMenu fileStoreMenu)
    {
        return fileStoreMenuMapper.selectFileStoreMenuList(fileStoreMenu);
    }

    /**
     * 新增菜单权限
     * 
     * @param fileStoreMenu 菜单权限
     * @return 结果
     */
    @Override
    public int insertFileStoreMenu(FileStoreMenu fileStoreMenu)
    {
        fileStoreMenu.setCreateTime(DateUtils.getNowDate());
        return fileStoreMenuMapper.insertFileStoreMenu(fileStoreMenu);
    }

    /**
     * 修改菜单权限
     * 
     * @param fileStoreMenu 菜单权限
     * @return 结果
     */
    @Override
    public int updateFileStoreMenu(FileStoreMenu fileStoreMenu)
    {
        fileStoreMenu.setUpdateTime(DateUtils.getNowDate());
        return fileStoreMenuMapper.updateFileStoreMenu(fileStoreMenu);
    }

    /**
     * 批量删除菜单权限
     * 
     * @param menuIds 需要删除的菜单权限主键
     * @return 结果
     */
    @Override
    public int deleteFileStoreMenuByMenuIds(Long[] menuIds)
    {
        return fileStoreMenuMapper.deleteFileStoreMenuByMenuIds(menuIds);
    }

    /**
     * 删除菜单权限信息
     * 
     * @param menuId 菜单权限主键
     * @return 结果
     */
    @Override
    public int deleteFileStoreMenuByMenuId(Long menuId)
    {
        return fileStoreMenuMapper.deleteFileStoreMenuByMenuId(menuId);
    }
}
