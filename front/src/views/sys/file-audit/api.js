// 统一请求路径前缀在libs/axios.js中修改
import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

// 分页获取数据
export const getGetFileAuditList = (params) => {
    return getRequest('/getFileAudit/getByPage', params)
}
// 添加
export const addGetFileAudit = (params) => {
    return postRequest('/getFileAudit/insertOrUpdate', params)
}
// 编辑
export const editGetFileAudit = (params) => {
    return putRequest('/getFileAudit/insertOrUpdate', params)
}
// 删除
export const deleteGetFileAudit = (params) => {
    return postRequest('/getFileAudit/delByIds', params)
}
export const passOrDis = (params) => {
    return postRequest('/getFileAudit/passOrDis', params)
}
export const getMyGetFileAuditList = (params) => {
    return getRequest('/getFileAudit/getMyPage', params)
}