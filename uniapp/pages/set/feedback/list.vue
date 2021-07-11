<template>
	<view class="feedback-list">
		<view class="oa-list">
			<view class="oa-list-item" @tap="navTo(`/pages/set/feedback/detail?id=1`)">
				<view class="wrapper">
					<view class="address-box">
						<text class="tag" :class="'text-' + themeColor.name">{{ 1 | feedbackFilter }}</text>
						<text class="address in1line">UI无法直视，丑哭了</text>
					</view>
					<view class="u-box">
						<text class="name">{{ '管理员未回复' }}</text>
						<text class="mobile">联系方式：{{ '暂无' }}</text>
					</view>
				</view>
			</view>
			<view class="oa-list-item" @tap="navTo(`/pages/set/feedback/detail?id=1`)">
				<view class="wrapper">
					<view class="address-box">
						<text class="tag" :class="'text-' + themeColor.name">{{ 2 | feedbackFilter }}</text>
						<text class="address in1line">UI界面显示错乱</text>
					</view>
					<view class="u-box">
						<text class="name">{{ '管理员未回复' }}</text>
						<text class="mobile">联系方式：{{ '暂无' }}</text>
					</view>
				</view>
			</view>
			<view class="oa-list-item" @tap="navTo(`/pages/set/feedback/detail?id=1`)">
				<view class="wrapper">
					<view class="address-box">
						<text class="tag" :class="'text-' + themeColor.name">{{ 3| feedbackFilter }}</text>
						<text class="address in1line">业务合作，怎么联系？</text>
					</view>
					<view class="u-box">
						<text class="name">加群咨询群主</text>
						<text class="mobile">联系方式：{{ '暂无' }}</text>
					</view>
				</view>
			</view>
		</view>
		<view class="add-btn-wrapper">
			<button class="add-btn" :class="'bg-' + themeColor.name" @tap="navTo(`/pages/set/feedback/feedback`)">
				意见反馈
			</button>
		</view>

	</view>
</template>

<script>
	export default {
		filters: {
			feedbackFilter(type) {
				const feedbackType = ['', '功能建议', 'BUG反馈', '业务咨询'];
				return feedbackType[parseInt(type, 10)];
			}
		},

		onShow() {
			this.initData();
		},
		methods: {
			// 数据初始化
			initData() {
				uni.setNavigationBarColor({
					frontColor: '#ffffff',
					backgroundColor: this.themeColor.color,
					animation: {
						duration: 400,
						timingFunc: 'easeIn'
					}
				})
			},

			navTo(route) {
				this.$mRouter.push({
					route
				});
			}
		}
	};
</script>

<style lang="scss">
	page {
		background-color: $page-color-base;
	}

	.feedback-list {
		position: relative;

		.wrapper {
			display: flex;
			flex-direction: column;
			flex: 1;
		}

		.address-box {
			display: flex;
			align-items: center;

			.tag {
				font-size: 24upx;
				margin-right: 10upx;
				border: 1px solid;
				border-radius: 4upx;
				padding: 4upx 10upx;
				line-height: 1;
			}

			.address {
				font-size: 30upx;
				color: $font-color-dark;
			}
		}

		.u-box {
			font-size: 28upx;
			color: $font-color-light;
			margin-top: 16upx;

			.name {
				margin-right: 30upx;
			}
		}
	}
</style>
