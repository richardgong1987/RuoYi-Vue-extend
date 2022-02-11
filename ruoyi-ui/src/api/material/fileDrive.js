import request from '@/utils/request'

// 查询菜单权限列表
export function listFileDrive(query) {
  return request({
    url: '/material/fileDrive/list',
    method: 'get',
    params: query
  })
}

// 查询菜单权限详细
export function getFileDrive(menuId) {
  return request({
    url: '/material/fileDrive/' + menuId,
    method: 'get'
  })
}

// 新增菜单权限
export function addFileDrive(data) {
  return request({
    url: '/material/fileDrive',
    method: 'post',
    data: data
  })
}

// 修改菜单权限
export function updateFileDrive(data) {
  return request({
    url: '/material/fileDrive',
    method: 'put',
    data: data
  })
}

// 删除菜单权限
export function delFileDrive(menuId) {
  return request({
    url: '/material/fileDrive/' + menuId,
    method: 'delete'
  })
}
