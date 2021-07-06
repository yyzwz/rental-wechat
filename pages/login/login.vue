<template>
	<view>
		<u-form :model="form" ref="uForm" class="wrap">
			<u-form-item label="账号" class="item"><u-input v-model="form.code" placeholder="请输入账号"/></u-form-item>
			<u-form-item label="密码" class="item"><u-input v-model="form.pwd" placeholder="请输入密码" type="password"/></u-form-item>
			<u-button type="primary" @click="login" class="login">登录</u-button>
		</u-form>
		<view class="small">
			<text class="smallText">艾是布家居 版权所有</text>
		</view>
	</view>
</template>

<script>
	const app = getApp();
export default {
	data() {
		return {
			form: {
				code: '',
				pwd: '',
			},
			token: '',
			msg: ''
		};
	},
	methods: {
		login() {
			var that = this;
			uni.request({
			    url: 'http://49.234.32.81:13145/xboot/uniapp/login', // 0892 123456
			    data: {
			        code: that.form.code,
					pwd: that.form.pwd
			    },
			    header: {
			        'custom-header': 'hello'
			    },
			    success: (res) => {
					if(res.statusCode != 200) {
						uni.showToast({
							title:"请求失败",
							icon:"none"
						})
					}
			        else if(res.data.result.success) {
						app.token = res.data.result.token;
						uni.switchTab({
							url:'../index/index'
						})
					} else {
						uni.showToast({
							title:"账号密码错误",
							icon:"none"
						})
					}
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