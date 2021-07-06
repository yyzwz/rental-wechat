<template>
	<view class="about">
		<view
			class="list-cell b-b"
			v-for="item in navList"
			:key="item.title"
			@tap="
				navTo(`/pages/set/about/detail?field=${item.url}&title=${item.title}`)
			"
			hover-class="cell-hover"
			:hover-stay-time="50"
		>
			<text class="cell-tit">{{ item.title }}</text>
			<text class="cell-tip">{{ item.content }}</text>
			<text class="cell-more iconfont iconyou"></text>
		</view>
		<view class="history-section icon">
			<view class="sec-header">
				<i class="iconfont iconshare"></i>
				<text>二维码</text>
			</view>
			<view class="qrcode-wrapper">
				<view class="qrcode-img-wrapper">
					<oa-image class="qrcode-img" :src="aboutInfo.qrcode || ''" ></oa-image>
				</view>
				<text class="info">扫码后在浏览器打开</text>
			</view>
		</view>
	</view>
</template>
<script>
export default {
	data() {
		return {
			aboutInfo: {},
			navList: [

				{ title: '关于我们', url: 'about_me' },
				{ title: '注册协议', url: 'protocol_register' },
				{ title: '隐私协议', url: 'protocol_privacy' }
			],
			appName: this.$mSettingConfig.appName,
		};
	},
	onShow() {
		uni.setNavigationBarColor({
		    frontColor: '#ffffff',
		    backgroundColor: this.themeColor.color,
		    animation: {
		        duration: 400,
		        timingFunc: 'easeIn'
		    }
		})
	},
	onLoad() {
		this.initData();
	},
	methods: {
		// 初始化数据
		initData() {
			uni.setNavigationBarTitle({ title: `关于维博网络` });
			const userInfo = uni.getStorageSync('userInfo') || {};
		},
		// 统一跳转接口
		navTo(route) {
			this.$mRouter.push({ route });
		}
	}
};
</script>
<style lang="scss">
page {
	position: relative;
	background-color: #f5f5f5;
}
/*关于商城*/
.about {
	padding: 20upx 0;
	.history-section {
		padding: 30upx 0 0;
		margin-top: 20upx;
		background: #fff;
		border-radius: 10upx;
		.sec-header {
			display: flex;
			align-items: center;
			font-size: $font-base;
			color: $font-color-dark;
			line-height: 40upx;
			margin-left: 30upx;
			.iconfont {
				font-size: 44upx;
				color: #5eba8f;
				margin-right: 16upx;
				line-height: 40upx;
			}
		}
		.qrcode-wrapper {
			padding: $spacing-lg 0;
			text-align: center;
			.qrcode-img-wrapper {
				display: flex;
				justify-content: center;
				align-items: center;
			}
			.qrcode {
				height: 280upx;
			}
			.qrcode-img {
				width: 300upx;
				height: 300upx;
				image {
					width: 300upx;
					height: 300upx;
				}
			}
			.info {
				display: block;
			}
		}
	}
}
</style>
