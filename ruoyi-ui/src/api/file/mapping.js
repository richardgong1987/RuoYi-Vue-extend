import request from '@/utils/request'

// 查询文件关系列表
export function listMapping(query) {
  return request({
    url: '/file/mapping/list',
    method: 'get',
    params: query
  })
}
export function listObjects(query) {
  return request({
    url: '/file/mapping/listObjects',
    headers: {
      isToken: false
    },
    method: 'get',
    params: query
  })
}
export function deleteListObjects(query) {
  return request({
    url: '/file/mapping/listObjects/delete',
    method: 'delete',
    params: query
  })
}

// 查询文件关系详细
export function getMapping(id) {
  return request({
    url: '/file/mapping/' + id,
    method: 'get'
  })
}

// 新增文件关系
export function addMapping(data) {
  return request({
    url: '/file/mapping',
    method: 'post',
    data: data
  })
}

// 修改文件关系
export function updateMapping(data) {
  return request({
    url: '/file/mapping',
    method: 'put',
    data: data
  })
}

// 删除文件关系
export function delMapping(id) {
  return request({
    url: '/file/mapping/' + id,
    method: 'delete'
  })
}
