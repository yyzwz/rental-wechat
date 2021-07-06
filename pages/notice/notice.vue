<template>
	<view class="secret">
		<view class="notify-list">
			<view class="row" @tap="navTo(1)">
				<view class="carrier">
					<view class="notify-wrapper">
						<view class="title in3line">办公系统正式启用办公系统正式启用办公系统正式启用</view>
						<view class="time">2020-12-12</view>
						<view class="un-read" :class="'bg-'+themeColor.name"></view>
					</view>
				</view>
			</view>
			<view class="row" @tap="navTo(1)">
				<view class="carrier">
					<view class="notify-wrapper">
						<view class="title in3line">办公系统正式启用办公系统正式启用办公系统正式启用</view>
						<view class="time">2020-12-12</view>
						<view class="un-read" :class="'bg-'+themeColor.name"></view>
					</view>
				</view>
			</view>
			<view class="row" @tap="navTo(1)">
				<view class="carrier">
					<view class="notify-wrapper">
						<view class="title in3line">办公系统正式启用办公系统正式启用办公系统正式启用办公系统正式启用</view>
						<view class="time">2020-12-12</view>
						<view class="un-read" :class="'bg-'+themeColor.name"></view>
					</view>
				</view>
			</view>
		</view>
	</view>

</template>

<script>
	export default {
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

			// 通用跳转
			async navTo(item) {
				this.$mRouter.push({
					route: `/pages/notice/detail?id=${item}`
				});
			},
		}
	};
</script>

<style lang="scss">
	page {
		background-color: $page-color-base;
	}

	.secret {
		.add-round {
			position: fixed;
			z-index: 999;
			right: 30rpx;
			bottom: 30rpx;
			border-radius: 50%;
			width: 120rpx;
			height: 120rpx;
			color: #fff;
			text-align: center;
			line-height: 120rpx;
			font-weight: 100;
			font-size: 80rpx;
		}

		.notify-list {
			margin-top: 20upx;

			.read {
				text-align: right;
				margin-right: $spacing-base;
				margin-top: $spacing-base;
				margin-bottom: $spacing-sm;

				text {
					margin-left: $spacing-base;
				}
			}

			.row {
				width: calc(94%);
				height: calc(22vw + 40upx);
				margin: 0 auto $spacing-base;
				border-radius: 15upx;
				box-shadow: 0upx 5upx 20upx rgba(0, 0, 0, 0.1);
				display: flex;
				align-items: center;
				position: relative;
				overflow: hidden;
				z-index: 4;
				border: 0;

				.menu {
					.iconfont {
						color: #fff;
						font-size: 60upx;
					}

					position: absolute;
					width: 29%;
					height: 100%;
					right: 0;
					display: flex;
					justify-content: center;
					align-items: center;
					color: #fff;
					z-index: 2;
				}

				.carrier {
					@keyframes showMenu {
						0% {
							transform: translateX(0);
						}

						100% {
							transform: translateX(-30%);
						}
					}

					@keyframes closeMenu {
						0% {
							transform: translateX(-30%);
						}

						100% {
							transform: translateX(0);
						}
					}

					&.open {
						animation: showMenu 0.25s linear both;
					}

					&.close {
						animation: closeMenu 0.15s linear both;
					}

					background-color: #fff;
					position: absolute;
					width: 100%;
					padding: 0 0;
					height: 100%;
					z-index: 3;
					display: flex;
					align-items: center;
				}
			}

			.notify-wrapper {
				background-color: $color-white;
				width: 100%;
				padding: $spacing-base $spacing-lg $spacing-base $spacing-lg;
				margin: $spacing-base 0 0;
				border-radius: 15upx;
				position: relative;

				.title {
					font-size: $font-lg;
					color: $font-color-dark;
					font-weight: 500;
					margin: 0 0 $spacing-sm;
				}

				.content {
					font-size: $font-sm;
					color: $font-color-base;
					height: 75upx;
					line-height: 36upx;
				}

				.time {
					font-size: $font-base;
					color: $font-color-light;
				}

				.type {
					position: absolute;
					top: 26upx;
					left: -10upx;
					border: none;
					font-size: $font-sm;
					opacity: 0.8;
				}

				.un-read {
					display: inline-block;
					width: 12upx;
					height: 12upx;
					border-radius: 50%;
					position: absolute;
					top: 32upx;
					right: 30upx;
				}
			}
		}

		.notify-empty {
			position: fixed;
			left: 0;
			top: 0;
			width: 100%;
			height: 100vh;
			padding-bottom: 100upx;
			display: flex;
			justify-content: center;
			flex-direction: column;
			align-items: center;
			background: #fff;

			.iconfont {
				font-size: $font-lg + 100upx;
			}

			.empty-tips {
				display: flex;
				font-size: $font-sm + 2upx;
				color: $font-color-disabled;

				.navigator {
					margin-left: 16upx;
				}
			}
		}
	}
</style>
