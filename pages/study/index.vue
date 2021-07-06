<template>
	<view class="visit">
		<view class="uni-list">
			<view class="uni-list-cell" hover-class="uni-list-cell-hover" v-for="(item, index) in studyList" :key="index" @tap="navTo(`/pages/study/detail?id=${item.id}`)">
				<view class="uni-media-list">
					<image class="uni-media-list-logo" :src="item.cover"></image>
					<view class="uni-media-list-body">
						<view class="uni-media-list-text-top">{{item.description}}</view>
						<view class="uni-media-list-text-bottom">
							<text>{{item.author}}</text>
							<text>{{item.created_at | time}}</text>
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>

</template>

<script>

	import moment from '@/common/moment';
	export default {
		data() {
			return {
				studyList: [{"id":"8","merchant_id":"2","title":"共创人类发展的美好未来","cover":"http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/09/10/image_1599669475_VQXiR1bX.jpg","seo_key":"","seo_content":"","cate_id":"1","description":"“十三五”期间，中国不断扩大开放，深入推进共建“一带一路”，构建人类命运共同体共识不断巩固，务实合作根基不断夯实，全球治理空间不断拓展。","position":"0","content":"","link":"","author":"","view":"473","sort":"0","status":"1","created_at":"1601956562","updated_at":"1601956617"},{"id":"7","merchant_id":"2","title":"办公系统正式开通","cover":"http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/09/10/image_1599669347_KbFsxS3m.jpg","seo_key":"","seo_content":"","cate_id":"1","description":"办公系统正式开通，请大家下载安装应用","position":"0","content":"","link":"","author":"维博网络","view":"473","sort":"0","status":"1","created_at":"1601915568","updated_at":"1606156145"}],
				// 控制滑动效果
				theIndex: null,
				oldIndex: null
			};
		},
		filters: {
			time(val) {
				return moment(val * 1000).format('YY/MM/DD');
			},
		},

		async onLoad(options) {
			await this.initData();
		},
		
		methods: {
			// 数据初始化
			initData() {
				this.hasLogin = this.$mStore.getters.hasLogin;
				uni.setNavigationBarColor({
					frontColor: '#ffffff',
					backgroundColor: this.themeColor.color,
					animation: {
						duration: 400,
						timingFunc: 'easeIn'
					}
				});

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

	.visit {
		.uni-media-list-logo {
			width: 180rpx;
			height: 140rpx;
		}

		.uni-media-list-body {
			height: auto;
			justify-content: space-around;
		}

		.uni-media-list-text-top {
			height: 74rpx;
			font-size: 28rpx;
			overflow: hidden;
		}

		.uni-media-list-text-bottom {
			display: flex;
			flex-direction: row;
			justify-content: space-between;
		}

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
