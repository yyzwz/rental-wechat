
export default {
	// 权限路由 在main.js可实现路由拦截 所以路由都需要注册 待完善
	
	// 非权限路由
	main: {
		name: '首页',
		path: '/pages/index/index'
	},
	
	cart: {
		name: '应用',
		path: '/pages/cart/cart'
	},
	login: {
		name: '登录',
		path: '/pages/public/login'
	},
	index: {
		name: '注册',
		path: '/pages/public/register'
	},
	
};
