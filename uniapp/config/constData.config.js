export default {
	// app应用名称
	appName: '通用办公',

	// 验证码发送间隔
	sendCodeTime: 60,

	// 设置-设置中心
	setList: [
		{
			title: '个人资料',
			url: '/pages/user/userinfo/userinfo',
			content: ''
		},
		{
			title: '修改密码',
			url: '/pages/public/password?type=1',
			content: ''
		},
		{
			title: '清除缓存',
			url: 'clearCache',
			content: ''
		},
		{
			title: '关于我们',
			url: '/pages/set/about/about',
			content: '',
			class: 'mT'
		},
		{
			title: '站点帮助',
			url: '/pages/set/helper/index',
			content: ''
		},
		/*  #ifdef APP-PLUS  */
		{
			title: '检查更新',
			url: 'versionUpgrade',
			content: ''
		},
		/*  #endif  */
		{
			title: '意见反馈',
			url: '/pages/set/feedback/list',
			content: ''
		},
		
	],

	//应用中心-工作流
	worksList: [{
			icon: 'iconbaoxiu',
			url: '/pages/works/repair/index',
			title: '报修',
			color: '#ff6b81'
		},
		{
			icon: 'iconbangongyongpin',
			url: '/pages/works/repair/index',
			title: '申领',
			color: '#ff6b81'
		},
		{
			icon: 'icongoumai',
			url: '/pages/works/repair/index',
			title: '申购',
			color: '#ff6b81'
		},
		{
			icon: 'iconcheliang',
			url: '/pages/works/repair/index',
			title: '用车',
			color: '#ff6b81'
		},
		{
			icon: 'iconjiabanshixiang',
			url: '/pages/works/overtime/index',
			title: '加班',
			color: '#ff6b81'
		},
		{
			icon: 'iconziyuan208',
			url: '/pages/works/repair/index',
			title: '出差',
			color: '#ff6b81'
		},
		{
			icon: 'iconricheng',
			url: '/pages/works/repair/index',
			title: '请假',
			color: '#ff6b81'
		},
		{
			icon: 'iconshenpijieshu',
			url: '/pages/works/repair/index',
			title: '报销',
			color: '#ff6b81'
		},


	],
	// 学习中心
	studySectionList: [{
			title: '制度管理',
			icon: 'iconguizhangzhidu',
			url: '/pages/study/index?cate_id=3',
			num: null
		},
		{
			title: '安全知识',
			icon: 'iconanquan',
			url: '/pages/study/index?cate_id=5',
			num: null
		},
		{
			title: '业务知识',
			icon: 'iconrizhi',
			url: '/pages/study/index?cate_id=4',
			num: null
		},
		{
			title: '新闻动态',
			icon: 'iconxinwen',
			url: '/pages/study/index?cate_id=1',
			num: null
		}
	],
	// 个人中心
	mycenterList: [{
			title: '我的日志',
			icon: 'iconguizhangzhidu',
			url: '',
			num: null
		},
		{
			title: '我的日程',
			icon: 'iconanquan',
			url: '',
			num: null
		},
		{
			title: '我的总结',
			icon: 'iconrizhi',
			url: '',
			num: null
		}

	],
	// 日常应用
	manageSectionList: [
		{
			icon: 'iconzichan',
			url: '',
			title: '资产',
			color: '#ff6b81'
		},
		{
			icon: 'iconcheliang',
			url: '',
			title: '车辆',
			color: '#ff6b81'
		},
		{
			icon: 'icondangan',
			url: '',
			title: '档案',
			color: '#ff6b81'
		},
		{
			icon: 'iconyuangong',
			url: '',
			title: '员工',
			color: '#ff6b81'
		},
		{
			icon: 'iconhetong',
			url: '',
			title: '合同',
			color: '#ff6b81'
		},
		{
			icon: 'iconjiangcheng',
			url: '',
			title: '奖惩',
			color: '#ff6b81'
		},
		{
			icon: 'iconshebao',
			url: '',
			title: '社保',
			color: '#ff6b81'
		},


	],
// 其他应用
	otherSectionList: [
		{
			title: '就餐',
			icon: 'iconcanyin',
			url: '',
			color: '#ff6b81'
		},
		{
			title: '采购',
			icon: 'icongoumai1',
			url: '',
			color: '#ff6b81'
		},
		{
			title: '巡更',
			icon: 'iconxungeng',
			url: '',
			color: '#ff6b81'
		},
		{
				icon: 'iconkaoqin',
				url: '/pages/attend/plan',
				title: '考勤',
				color: '#ff6b81'
		},
		{
			title: '通讯录',
			icon: 'icontongxunlu',
			url: '',
			color: '#ff6b81'
		},
	],
	// 消息类型 1:公告;2:提醒;3:私信
	notifyTypeList: [{
			type: 0,
			content: ''
		},
		{
			type: 1,
			content: '公告'
		},
		{
			type: 2,
			content: '提醒'
		},
		{
			type: 3,
			content: '私信'
		}
	],
	// 主题列表
	themeList: [{
			title: '官方',
			name: 'rf',
			color: '#fa436a',
			tabList: [
				'/static/tab-home-rf.png',
				'/static/tab-notify-rf.png',
				'/static/tab-cate-rf.png',
				'/static/tab-my-rf.png'
			]
		},
		{
			title: '嫣红',
			name: 'red',
			color: '#e54d42',
			tabList: [
				'/static/tab-home-red.png',
				'/static/tab-notify-red.png',
				'/static/tab-cate-red.png',
				'/static/tab-my-red.png'
			]
		},
		{
			title: '桔橙',
			name: 'orange',
			color: '#f37b1d',
			tabList: [
				'/static/tab-home-orange.png',
				'/static/tab-notify-orange.png',
				'/static/tab-cate-orange.png',
				'/static/tab-my-orange.png'
			]
		},
		{
			title: '明黄',
			name: 'yellow',
			color: '#fbbd08',
			tabList: [
				'/static/tab-home-yellow.png',
				'/static/tab-notify-yellow.png',
				'/static/tab-cate-yellow.png',
				'/static/tab-my-yellow.png'
			]
		},
		{
			title: '橄榄',
			name: 'olive',
			color: '#8dc63f',
			tabList: [
				'/static/tab-home-olive.png',
				'/static/tab-notify-olive.png',
				'/static/tab-cate-olive.png',
				'/static/tab-my-olive.png'
			]
		},
		{
			title: '森绿',
			name: 'green',
			color: '#39b54a',
			tabList: [
				'/static/tab-home-green.png',
				'/static/tab-notify-green.png',
				'/static/tab-cate-green.png',
				'/static/tab-my-green.png'
			]
		},
		{
			title: '天青',
			name: 'cyan',
			color: '#1cbbb4',
			tabList: [
				'/static/tab-home-cyan.png',
				'/static/tab-notify-cyan.png',
				'/static/tab-cate-cyan.png',
				'/static/tab-my-cyan.png'
			]
		},
		{
			title: '海蓝',
			name: 'blue',
			color: '#0081ff',
			tabList: [
				'/static/tab-home-blue.png',
				'/static/tab-notify-blue.png',
				'/static/tab-cate-blue.png',
				'/static/tab-my-blue.png'
			]
		},
		{
			title: '姹紫',
			name: 'purple',
			color: '#6739b6',
			tabList: [
				'/static/tab-home-purple.png',
				'/static/tab-notify-purple.png',
				'/static/tab-cate-purple.png',
				'/static/tab-my-purple.png'
			]
		},
		{
			title: '木槿',
			name: 'mauve',
			color: '#9c26b0',
			tabList: [
				'/static/tab-home-mauve.png',
				'/static/tab-notify-mauve.png',
				'/static/tab-cate-mauve.png',
				'/static/tab-my-mauve.png'
			]
		},
		{
			title: '桃粉',
			name: 'pink',
			color: '#e03997',
			tabList: [
				'/static/tab-home-pink.png',
				'/static/tab-notify-pink.png',
				'/static/tab-cate-pink.png',
				'/static/tab-my-pink.png'
			]
		},
		{
			title: '棕褐',
			name: 'brown',
			color: '#a5673f',
			tabList: [
				'/static/tab-home-brown.png',
				'/static/tab-notify-brown.png',
				'/static/tab-cate-brown.png',
				'/static/tab-my-brown.png'
			]
		},
		{
			title: '玄灰',
			name: 'grey',
			color: '#8799a3',
			tabList: [
				'/static/tab-home-grey.png',
				'/static/tab-notify-grey.png',
				'/static/tab-cate-grey.png',
				'/static/tab-my-grey.png'
			]
		},
		{
			title: '草灰',
			name: 'gray',
			color: '#aaaaaa',
			tabList: [
				'/static/tab-home-gray.png',
				'/static/tab-notify-gray.png',
				'/static/tab-cate-gray.png',
				'/static/tab-my-gray.png'
			]
		},
		{
			title: '墨黑',
			name: 'black',
			color: '#333333',
			tabList: [
				'/static/tab-home-black.png',
				'/static/tab-notify-black.png',
				'/static/tab-cate-black.png',
				'/static/tab-my-black.png'
			]
		}
	],
	
};
