// 统一请求路径前缀在libs/axios.js中修改
import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

// 分页获取数据
export const getCarArchivesList = (params) => {
    return getRequest('/carArchives/getByPage', params)
}
// 添加
export const addCarArchives = (params) => {
    return postRequest('/carArchives/insertOrUpdate', params)
}
// 编辑
export const editCarArchives = (params) => {
    return putRequest('/carArchives/insertOrUpdate', params)
}
// 删除
export const deleteCarArchives = (params) => {
    return postRequest('/carArchives/delByIds', params)
}