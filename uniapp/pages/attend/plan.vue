<template>
	<view class="get">
		<view>
			<uni-calendar :insert="true" :lunar="true" :selected="selected" @change="change" />
		</view>
		<view class="get-list">
			<view v-for="(item, index) in recordList" :key="index" class="row" @tap="navTo(item)">
				<view class="carrier">
					<view class="get-wrapper">
						<view class="title in1line">
							{{item.attendClasses.title}}<template v-if="item.type==1">[签退]</template><template v-if="item.type==0">[签到]</template>
						</view>
						<view class="content in2line">
							<template v-for="(record, index) in checkState">
								<template v-if="record.key==item.state">考勤状态:{{ record.value }}(上班时间:{{item.attendClasses.begin_time}}-{{item.attendClasses.end_time}})</template>
							</template>
						</view>
						<view class="time">{{item.member.realname}} {{item.created_at|time}} </view>
					</view>
				</view>
			</view>
		</view>

		<view class="add-round bg-deepBlue" :class="'bg-' + themeColor.name" @click="navToAdd(`/pages/attend/add`)">
			<text class="cuIcon-add text-xxl"></text>
		</view>
		<!--加载动画-->
	</view>

</template>

<script>
	import uniCalendar from '@/components/oa-calendar/oa-calendar.vue'
	import moment from '@/common/moment';
	export default {
		components: {
			uniCalendar
		},
		data() {
			return {
				today: undefined,
				selectdate: undefined,
				startTime: moment().startOf('day').format('YYYY-MM-DD'),
				getList: [],
				checkState: [{"key":0,"value":"未打卡"},{"key":1,"value":"正常"},{"key":2,"value":"迟到"},{"key":3,"value":"早退"}],
				selected: [{date: '2020-12-12',info: "考勤"},{date: '2020-12-13',info: "考勤"},{date: '2020-12-14',info: "考勤"}],
				recordList: [],
				// 控制滑动效果
				theIndex: null,
				oldIndex: null
			};
		},
		filters: {
			time(val) {
				return moment(val * 1000).format('YYYY-MM-DD HH:mm:ss');
			},

		},
		onShow() {
			this.initData();
		},
		// 下拉刷新
		onPullDownRefresh() {
			this.page = 1;
			this.getList = [];
			this.recordList = [];
			this.loading = true;
			this.getPlanList('refresh');
			this.getRecordList('refresh', this.selectdate);
		},
		// 加载更多
		onReachBottom() {
			if (this.loadingType === 'nomore') return;
			this.page++;
			this.getRecordList('', this.selectdate);
		},
		async onLoad(options) {},
		methods: {
			change(e) {
				if (e.type !== 0) this.selectdate = e.fulldate;
				else this.selectdate = '9999';
				this.getRecordList('refresh', this.selectdate);
			},
			// 数据初始化
			initData() {
				this.hasLogin = this.$mStore.getters.hasLogin;
				this.page = 1;
				this.recordList.length = 0;
				this.getList.length = 0;
				this.getPlanList();
				this.getRecordList('', this.selectdate);
				uni.setNavigationBarColor({
					frontColor: '#ffffff',
					backgroundColor: this.themeColor.color,
					animation: {
						duration: 400,
						timingFunc: 'easeIn'
					}
				})
			},

			// 获取计划列表
			async getPlanList(type) {
				this.getList = [{"id":"1","merchant_id":"2","member_id":"69","classes_id":"1","check_date":"2020-12-01,2020-12-02,2020-12-03,2020-12-04,2020-12-05,2020-12-06,2020-12-07,2020-12-08,2020-12-09,2020-12-10,2020-12-11,2020-12-12,2020-12-13,2020-12-14,2020-12-15,2020-12-16,2020-12-17,2020-12-18,2020-12-19,2020-12-20,2020-12-21,2020-12-22,2020-12-23,2020-12-24,2020-12-25,2020-12-26,2020-12-27,2020-12-28,2020-12-29,2020-12-30,2020-12-31","begin_time":"08:00:00","end_time":"18:00:00","status":"1","created_at":"1602046812","updated_at":"1605764620","member":{"id":"69","merchant_id":"2","department_id":"13","role_id":"18","username":"18986860543","password_hash":"$2y$13$AiBhEM4eFqzVPz4LDLkPBOk/z7Kbt3RJJiEwbVpZCTpi0qum0OHfK","auth_key":"PhdPH1ybPa3G5lKq4gf4IsOfSbX4X2IM","password_reset_token":"","type":"1","realname":"古月","head_portrait":"","gender":"1","qq":"219311","email":"21931118@qq.com","birthday":"1999-09-09","province_id":"0","city_id":"0","area_id":"0","address":"","mobile":"18986860543","home_phone":"","dingtalk_robot_token":"","visit_count":"251","last_time":"1608219242","last_ip":"171.115.80.26","role":"10","status":"1","created_at":"1601722792","updated_at":"1608219242"},"attendClasses":{"id":"1","merchant_id":"2","title":"白班","begin_time":"08:30:00","end_time":"17:00:00","status":"1","created_at":"1605834038","updated_at":"1606783421"},"check":[{"id":"32","merchant_id":"2","member_id":"69","classes_id":"1","type":"0","picture":"http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/12/02/image_1606918536_fYvzCA8w.jpg","covers":"[\"http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/12/02/image_1606918536_fYvzCA8w.jpg\"]","lon":"116.444908","lat":"39.917903","address":"北京市朝阳区秀水北街25号","state":"2","begin_time":"08:00:00","end_time":"18:00:00","status":"1","created_at":"1607001281","updated_at":"1607001281"},{"id":"33","merchant_id":"2","member_id":"69","classes_id":"1","type":"0","picture":"http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/12/02/image_1606918536_fYvzCA8w.jpg","covers":"[\"http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/12/02/image_1606918536_fYvzCA8w.jpg\"]","lon":"116.444908","lat":"39.917903","address":"北京市朝阳区秀水北街25号","state":"2","begin_time":"08:00:00","end_time":"18:00:00","status":"1","created_at":"1607318712","updated_at":"1607318712"}]}];
				for (let i = 0, m = 0; i < this.getList.length; i++) {
					let check = this.getList[i].check_date.split(",");
				}
			},
			// 获取记录列表
			getRecordList(type, date) {
				this.recordList = [{"id":"33","merchant_id":"2","member_id":"69","classes_id":"1","type":"0","picture":"http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/12/02/image_1606918536_fYvzCA8w.jpg","covers":"[\"http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/12/02/image_1606918536_fYvzCA8w.jpg\"]","lon":"116.444908","lat":"39.917903","address":"北京市朝阳区秀水北街25号","state":"2","begin_time":"08:00:00","end_time":"18:00:00","status":"1","created_at":"1607318712","updated_at":"1607318712","member":{"id":"69","merchant_id":"2","department_id":"13","role_id":"18","username":"18986860543","password_hash":"$2y$13$AiBhEM4eFqzVPz4LDLkPBOk/z7Kbt3RJJiEwbVpZCTpi0qum0OHfK","auth_key":"PhdPH1ybPa3G5lKq4gf4IsOfSbX4X2IM","password_reset_token":"","type":"1","realname":"古月","head_portrait":"","gender":"1","qq":"219311","email":"21931118@qq.com","birthday":"1999-09-09","province_id":"0","city_id":"0","area_id":"0","address":"","mobile":"18986860543","home_phone":"","dingtalk_robot_token":"","visit_count":"251","last_time":"1608219242","last_ip":"171.115.80.26","role":"10","status":"1","created_at":"1601722792","updated_at":"1608219242"},"attendClasses":{"id":"1","merchant_id":"2","title":"白班","begin_time":"08:30:00","end_time":"17:00:00","status":"1","created_at":"1605834038","updated_at":"1606783421"}},{"id":"32","merchant_id":"2","member_id":"69","classes_id":"1","type":"0","picture":"http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/12/02/image_1606918536_fYvzCA8w.jpg","covers":"[\"http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/12/02/image_1606918536_fYvzCA8w.jpg\"]","lon":"116.444908","lat":"39.917903","address":"北京市朝阳区秀水北街25号","state":"2","begin_time":"08:00:00","end_time":"18:00:00","status":"1","created_at":"1607001281","updated_at":"1607001281","member":{"id":"69","merchant_id":"2","department_id":"13","role_id":"18","username":"18986860543","password_hash":"$2y$13$AiBhEM4eFqzVPz4LDLkPBOk/z7Kbt3RJJiEwbVpZCTpi0qum0OHfK","auth_key":"PhdPH1ybPa3G5lKq4gf4IsOfSbX4X2IM","password_reset_token":"","type":"1","realname":"古月","head_portrait":"","gender":"1","qq":"219311","email":"21931118@qq.com","birthday":"1999-09-09","province_id":"0","city_id":"0","area_id":"0","address":"","mobile":"18986860543","home_phone":"","dingtalk_robot_token":"","visit_count":"251","last_time":"1608219242","last_ip":"171.115.80.26","role":"10","status":"1","created_at":"1601722792","updated_at":"1608219242"},"attendClasses":{"id":"1","merchant_id":"2","title":"白班","begin_time":"08:30:00","end_time":"17:00:00","status":"1","created_at":"1605834038","updated_at":"1606783421"}}];
				
			},
			
			navToAdd(route) {
				this.$mRouter.push({
					route: route
				});
			},
			navTo(item) {
				if (item.state == 0)
					this.$mRouter.push({
						route: `/pages/attend/add?id=${item.id}`
					});
				else
					uni.showToast({
						title: '该计划已经打过卡',
						icon: 'none',
						duration: 1000
					});
			}
		}
	};
</script>

<style lang="scss">
	page {
		background-color: $page-color-base;
	}

	.get {

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

		.get-list {
			margin-top: 20upx;

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

			.get-wrapper {
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

			}
		}

	}
</style>
