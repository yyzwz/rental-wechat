<template>
	<view>
		<u-form :model="form" ref="uForm" class="wrap">
			<u-form-item label="账号" class="item"><u-input v-model="form.code" placeholder="请输入账号"/></u-form-item>
			<u-form-item label="密码" class="item"><u-input v-model="form.pwd" placeholder="请输入密码" type="password"/></u-form-item>
			<u-button type="primary" @click="login" class="login">登录<u-loading mode="flower" :show="loadingFlag"></u-loading></u-button>
			{{resData}}
		</u-form>
	</view>
</template>

<script>
	const app = getApp();
export default {
	data() {
		return {
			loadingFlag: false,
			form: {
				code: '',
				pwd: '',
			},
			token: '',
			msg: '',
			resData: ''
		};
	},
	methods: {
		login() {
			var that = this;
			that.resData = "请求中";
			that.loadingFlag = true;
			uni.request({
			    url: 'http://125.124.223.192:82/xboot/uniapp/login',
			    data: {
			        code: that.form.code,
					pwd: that.form.pwd
			    },
				method: "GET",
			    success: (res) => {
					that.resData = res;
					console.log(res)
					that.loadingFlag = false;
					if(res.statusCode != 200) {
						uni.showToast({
							title:"请求失败",
							icon:"none"
						})
					}
			        else if(res.data.result.success) {
						app.token = res.data.result.token;
						app.userData = res.data.result.data;
						uni.switchTab({
							url:'../index/index'
						})
					} else {
						uni.showToast({
							title:"账号密码错误",
							icon:"none"
						})
					}
			    },fail(e) {
			    	console.log(e)
			    }
			});
		}
	}
};
</script>

<style lang="scss">
	.item{
		background-color: #f7f7f7;
		padding: 0 30rpx;
	}
	.wrap {
		padding: 80rpx 30rpx;
	}
	.login{
		margin-top: 80rpx;
	}
	.u-form-item--left{
		margin-left: 30rpx;
	}
	.small{
		width: 100%;
		display: flex;
		justify-content: center;
		position: fixed;
		bottom: var(--window-bottom);
	}
	.smallText{
		font-size: 22rpx;
		line-height: 22rpx;
		margin-bottom: 15rpx;
	}
</style>