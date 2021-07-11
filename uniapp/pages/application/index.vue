<template>
	<view class="notify">
		<view class="promotion-center">
			<list-cell icon="iconfenlei" :iconColor="themeColor.color" navigateType=""  title="工作流"></list-cell>
			<!-- 业务中心 -->
			<view class="category-list">
				<view class="category" v-for="(item, index) in worksList" :key="index" @tap.stop="navTo(item.url)">
					<view >
						<view class="img">
							<text class="iconfont" :class="[item.icon, 'text-'+themeColor.name]"></text>
						</view>
						<view class="text">{{ item.title }}</view>
					</view>

				</view>
			</view>
			<!-- 日常管理 -->
			<list-cell icon="iconyingyong" :iconColor="themeColor.color" navigateType=""  title="日常管理" ></list-cell>
			<view class="category-list">
				<view class="category" v-for="(item, index) in manageSectionList" :key="index" @tap.stop="navTo(item.url)">
					<view >
						<view class="img">
							<text class="iconfont" :class="[item.icon, 'text-'+themeColor.name]"></text>
						</view>
						<view class="text">{{ item.title }}</view>
					</view>

				</view>
			</view>
			<!-- 其他应用 -->
			<list-cell icon="iconyingyong" :iconColor="themeColor.color" navigateType=""  title="其他应用" ></list-cell>
			<view class="category-list" >
				<view class="category" v-for="(item, index) in otherSectionList" :key="index" @tap.stop="navTo(item.url)">
					<view >
						<view class="img">
							<text class="iconfont" :class="[item.icon, 'text-'+themeColor.name]"></text>
						</view>
						<view class="text">{{ item.title }}</view>
					</view>
				</view>
			</view>
		<!-- 学习中心 -->
			<list-cell icon="iconxuexi" :iconColor="themeColor.color" navigateType=""  title="学习中心"></list-cell>
			<view class="category-list">
				<view class="category" v-for="(item, index) in studySectionList" :key="index" @tap.stop="navTo(item.url)">
					<view >
						<view class="img">
							<text class="iconfont" :class="[item.icon, 'text-'+themeColor.name]"></text>
						</view>
						<view class="text">{{ item.title }}</view>
					</view>

				</view>
			</view>

		</view>


	</view>

</template>
<script>
	// import {memberInfo} from '@/api/userInfo';
	import moment from '@/common/moment';
	import mConstDataConfig from '@/config/constData.config';
	import listCell from '@/components/oa-list-cell';
	import {
		mapMutations
	} from 'vuex';

	export default {
		components: {
			listCell,
		},

		data() {
			return {
				hasLogin: false,
				worksList: this.$mConstDataConfig.worksList,
				studySectionList: this.$mConstDataConfig.studySectionList,
				manageSectionList: this.$mConstDataConfig.manageSectionList,
				otherSectionList: this.$mConstDataConfig.otherSectionList,
			};
		},
		filters: {
		},
		onShow() {
			this.initData();
		},
		computed: {
			bottom() {
				let bottom = 0;
				/*  #ifdef H5  */
				bottom = 90;
				/*  #endif */
				return bottom;
			}
		},

		methods: {
			// 数据初始化
			initData() {
				this.hasLogin = true;
				uni.setNavigationBarColor({
					frontColor: '#ffffff',
					backgroundColor: this.themeColor.color,
					animation: {
						duration: 400,
						timingFunc: 'easeIn'
					}
				})
			},
			
			// 统一跳转接口,拦截未登录路由
			navTo(route) {
				if (!route) return;
				if (!this.hasLogin) {
					uni.removeStorageSync('backToPage');
					this.$mRouter.push({
						route: '/pages/public/login'
					});
				}else {
					this.$mRouter.push({
						route
					});
				}
			},

		}
	};
</script>
<style lang="scss">
	page {
		background-color: $page-color-base;
	}

	.notify {
		.works-empty {
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
		.promotion-center {
			background: #fff;
			margin-bottom: 20upx;

			/*分类列表*/
			.category-list {
				width: 100%;
				padding: 0 0 30upx 0;
				border-bottom: solid 2upx #f6f6f6;
				display: flex;
				flex-wrap: wrap;

				.category {
					width: 25%;
					margin-top: 50upx;
					display: flex;
					justify-content: center;
					flex-wrap: wrap;

					.img {
						width: 100%;
						display: flex;
						justify-content: center;

						.iconfont {
							font-size: $font-lg + 50upx;
						}
					}

					.text {
						width: 100%;
						display: flex;
						justify-content: center;
						font-size: 24upx;
						color: #3c3c3c;
					}

					.share-btn {
						height: 142upx;
						text-align: left;
						background: none;
						padding: 0;
						margin: 0;
					}

					.share-btn:after {
						border: none;
						border-radius: none;
					}
				}
			}

		}

		.header {
			width: 100%;
			padding-left: $font-lg;
			height: 100upx;
			display: flex;
			align-items: center;
			position: fixed;
			top: 0;
			z-index: 10;
			background-color: #fff;
			/*  #ifdef  APP-PLUS  */
			top: var(--status-bar-height);

			/*  #endif  */
			.title {
				font-size: 36upx;
			}
		}

		.place {
			background-color: #ffffff;
			height: 100upx;
			/*  #ifdef  APP-PLUS  */
			margin-top: var(--status-bar-height);
			/*  #endif  */
		}

		.notify-list {
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
				padding: $spacing-base $spacing-lg $spacing-base 80upx;
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
