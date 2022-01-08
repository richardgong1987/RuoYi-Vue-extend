import request from '@/utils/request'

// 查询学校管理列表
export function listManagementSchools(query) {
  return request({
    url: '/peoples/managementSchools/list',
    method: 'get',
    params: query
  })
}

// 查询学校管理详细
export function getManagementSchools(id) {
  return request({
    url: '/peoples/managementSchools/' + id,
    method: 'get'
  })
}

// 新增学校管理
export function addManagementSchools(data) {
  return request({
    url: '/peoples/managementSchools',
    method: 'post',
    data: data
  })
}

// 修改学校管理
export function updateManagementSchools(data) {
  return request({
    url: '/peoples/managementSchools',
    method: 'put',
    data: data
  })
}

// 删除学校管理
export function delManagementSchools(id) {
  return request({
    url: '/peoples/managementSchools/' + id,
    method: 'delete'
  })
}
