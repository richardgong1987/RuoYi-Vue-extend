package com.ruoyi.file.service;

import java.util.List;
import java.util.Set;

import com.ruoyi.file.domain.FileStoreMenu;
import com.ruoyi.file.domain.RouterVoFile;
import com.ruoyi.file.domain.TreeSelectFile;

/**
 * 菜单权限Service接口
 *
 * @author ruoyi
 * @date 2022-02-11
 */
public interface IFileStoreMenuService
{
    /**
     * 根据用户查询系统菜单列表
     *
     * @param userId 用户ID
     * @return 菜单列表
     */
    public List<FileStoreMenu> selectMenuList(Long userId);

    /**
     * 根据用户查询系统菜单列表
     *
     * @param menu 菜单信息
     * @param userId 用户ID
     * @return 菜单列表
     */
    public List<FileStoreMenu> selectMenuList(FileStoreMenu menu, Long userId);

    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    public Set<String> selectMenuPermsByUserId(Long userId);

    /**
     * 根据用户ID查询菜单树信息
     *
     * @param userId 用户ID
     * @return 菜单列表
     */
    public List<FileStoreMenu> selectMenuTreeByUserId(Long userId);

    /**
     * 根据角色ID查询菜单树信息
     *
     * @param roleId 角色ID
     * @return 选中菜单列表
     */
    public List<Long> selectMenuListByRoleId(Long roleId);

    /**
     * 构建前端路由所需要的菜单
     *
     * @param menus 菜单列表
     * @return 路由列表
     */
    public List<RouterVoFile> buildMenus(List<FileStoreMenu> menus);

    /**
     * 构建前端所需要树结构
     *
     * @param menus 菜单列表
     * @return 树结构列表
     */
    public List<FileStoreMenu> buildMenuTree(List<FileStoreMenu> menus);

    /**
     * 构建前端所需要下拉树结构
     *
     * @param menus 菜单列表
     * @return 下拉树结构列表
     */
    public List<TreeSelectFile> buildMenuTreeSelect(List<FileStoreMenu> menus);

    /**
     * 根据菜单ID查询信息
     *
     * @param menuId 菜单ID
     * @return 菜单信息
     */
    public FileStoreMenu selectMenuById(Long menuId);

    /**
     * 是否存在菜单子节点
     *
     * @param menuId 菜单ID
     * @return 结果 true 存在 false 不存在
     */
    public boolean hasChildByMenuId(Long menuId);

    /**
     * 查询菜单是否存在角色
     *
     * @param menuId 菜单ID
     * @return 结果 true 存在 false 不存在
     */
    public boolean checkMenuExistRole(Long menuId);

    /**
     * 新增保存菜单信息
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public int insertMenu(FileStoreMenu menu);

    /**
     * 修改保存菜单信息
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public int updateMenu(FileStoreMenu menu);

    /**
     * 删除菜单管理信息
     *
     * @param menuId 菜单ID
     * @return 结果
     */
    public int deleteMenuById(Long menuId);

    /**
     * 校验菜单名称是否唯一
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public String checkMenuNameUnique(FileStoreMenu menu);
}
