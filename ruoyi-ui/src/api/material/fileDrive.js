import request from '@/utils/request'



// 查询菜单列表
export function listFileDrive(query) {
  return request({
    url: '/material/fileDrive/list',
    method: 'get',
    params: query
  })
}

// 查询菜单详细
export function getFileDrive(menuId) {
  return request({
    url: '/material/fileDrive/' + menuId,
    method: 'get'
  })
}

// 查询菜单下拉树结构
export function treeselect() {
  return request({
    url: '/material/fileDrive/treeselect',
    method: 'get'
  })
}

// 根据角色ID查询菜单下拉树结构
export function roleMenuTreeselect(roleId) {
  return request({
    url: '/material/fileDrive/roleMenuTreeselect/' + roleId,
    method: 'get'
  })
}

// 新增菜单
export function addFileDrive(data) {
  return request({
    url: '/material/fileDrive',
    method: 'post',
    data: data
  })
}

// 修改菜单
export function updateFileDrive(data) {
  return request({
    url: '/material/fileDrive',
    method: 'put',
    data: data
  })
}

// 删除菜单
export function delFileDrive(menuId) {
  return request({
    url: '/material/fileDrive/' + menuId,
    method: 'delete'
  })
}
