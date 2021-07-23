// 统一请求路径前缀在libs/axios.js中修改
import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

// 分页获取数据
export const getAuditList = (params) => {
    return getRequest('/audit/getByPage', params)
}
// 删除
export const deleteAudit = (params) => {
    return postRequest('/audit/delByIds', params)
}