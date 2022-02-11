package com.ruoyi.file.mapper;

import java.util.List;
import com.ruoyi.file.domain.FileStoreMenu;

/**
 * 菜单权限Mapper接口
 * 
 * @author ruoyi
 * @date 2022-02-11
 */
public interface FileStoreMenuMapper 
{
    /**
     * 查询菜单权限
     * 
     * @param menuId 菜单权限主键
     * @return 菜单权限
     */
    public FileStoreMenu selectFileStoreMenuByMenuId(Long menuId);

    /**
     * 查询菜单权限列表
     * 
     * @param fileStoreMenu 菜单权限
     * @return 菜单权限集合
     */
    public List<FileStoreMenu> selectFileStoreMenuList(FileStoreMenu fileStoreMenu);

    /**
     * 新增菜单权限
     * 
     * @param fileStoreMenu 菜单权限
     * @return 结果
     */
    public int insertFileStoreMenu(FileStoreMenu fileStoreMenu);

    /**
     * 修改菜单权限
     * 
     * @param fileStoreMenu 菜单权限
     * @return 结果
     */
    public int updateFileStoreMenu(FileStoreMenu fileStoreMenu);

    /**
     * 删除菜单权限
     * 
     * @param menuId 菜单权限主键
     * @return 结果
     */
    public int deleteFileStoreMenuByMenuId(Long menuId);

    /**
     * 批量删除菜单权限
     * 
     * @param menuIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFileStoreMenuByMenuIds(Long[] menuIds);
}
