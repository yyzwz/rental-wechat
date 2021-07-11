<template>
	<view class="oa-notice-detail">

		<view class="input-title">
			{{id}}
			<text>申请人：{{item.sqr}}</text>
		</view>
		<view class="input-title">
			审核状态<text v-show="item.status==0">尚未审核</text>
			<text v-show="item.status==1">已通过</text>
			<text v-show="item.status==2">未通过</text>
		</view>
		<view class="input-title">
			<text>车牌号：{{item.car}}</text>
		</view>
		<view class="input-title">
			<text>申请人：{{item.sqr}}</text>
		</view>
		<view class="input-title">
			<text>驾驶人：{{item.jcr}}</text>
		</view>
		<view class="input-title">
			<text>开始时间：{{item.kssj}}</text>
		</view>
		<view class="input-title">
			<text>结束时间：{{item.jssj}}</text>
		</view>
		<view class="input-title">
			<text>始发地：{{item.ccdd}}</text>
		</view>
		<view class="input-title">
			<text>目的地：{{item.mdd}}</text>
		</view>
		<view class="input-title">
			<text>原因：{{item.reason}}</text>
		</view>
		<view class="covers-body covers-uploader oa-uploader" v-if="imageList.length !== 0 ">
			<view class="uni-uploader">
				<view class="uni-uploader-head">
					<view class="uni-uploader-title">点击预览图片</view>
					<view class="uni-uploader-info">{{ imageList.length }}/6</view>
				</view>
				<view class="uni-uploader-body">
					<view class="uni-uploader__files">
						<block v-for="(image, index) in imageList" :key="index">
							<view class="uni-uploader__file" style="position: relative;">
								<oa-image class="uni-uploader__img" :src="image"></oa-image>
							</view>
						</block>
					</view>
				</view>
			</view>
		</view>

		<view class="uni-timeline">
			<view class="uni-timeline-item" :class="[
						index === 0 ? `text-${themeColor.name} uni-timeline-first-item` : '',
						index === approveDetail.length - 1 ? 'uni-timeline-last-item' : ''
					]"
			 v-for="(item, index) in approveDetail" :key="index">
				<view class="uni-timeline-item-divider"></view>
				<view class="uni-timeline-item-content">
					<view>
						{{ item.approve }}
					</view>
					<view class="datetime">
						{{item.name}} {{ item.suggest }} {{ item.time  }}
					</view>
				</view>
			</view>
		</view>
		<view class="feedback-title" v-show="item.status==0">
			<text>问题和意见</text>
			<text class="feedback-quick" @tap="chooseMsg">快速键入 <text class="iconfont iconxia"></text></text>
		</view>
		<view class="feedback-body" v-show="item.status==0">
			<textarea placeholder="请详细描述您的意见..." v-model="sendDate.suggest" class="feedback-textare" />
			</view>
		<view class="footer" v-show="item.status==0">
			<view v-for="(item, index) in radioList" :key="index">
			<button class="action-btn" :class="'text-' + themeColor.name" @tap="handleWorksOperation(item.key)">
				{{item.value}}
			</button>
			</view>
		</view>
		<!--加载动画-->
	</view>
</template>

<script>
	const app = getApp();
	export default {
		data() {
			return {
				danId: '',
				item: {
					car: '',
					carOwner: '',
					jcr: '',
					kssj: '',
					jssj: '',
					ccdd: '',
					shr: '',
					mdd: '',
					reason: ''
				},
				msgContents: [
					'同意',
					'不同意',
					'其他原因'
				],
				sendDate: {
					type: '1',
					suggest: '',
					contact_way: ''
				},
				workState: [{"key":"apply","value":"申请"},{"key":"audit","value":"审核"},{"key":"approve","value":"审批"},{"key":"result","value":"终审"},{"key":"refused","value":"拒绝"}],
				worksDetail: {"id":4,"merchant_id":2,"member_id":69,"cate_id":1,"content":"日常报修,2222","log":[{"id":68,"time":1602174818,"action":"repair/approve","suggest":"好好好的","name":"系统管理员","approve":"审批"},{"id":69,"time":1602174760,"action":"repair/audit","suggest":"好的","name":"古月","approve":"审核"},{"id":69,"time":1602174747,"action":"repair/apply","suggest":"提交申请","name":"古月","approve":"申请"}],"remind":0,"sort":0,"state":"approve","status":"repair/approve","created_at":1602174747,"updated_at":1602174818},
				approveDetail:[{"id":68,"time":'2021-12-12:12:12:12',"action":"repair/approve","suggest":"好好好的","name":"系统管理员","approve":"审批"},{"id":69,"time":'2021-12-12:12:12:12',"action":"repair/audit","suggest":"好的","name":"古月","approve":"审核"},{"id":69,"time":'2021-12-12:12:12:12',"action":"repair/apply","suggest":"提交申请","name":"古月","approve":"申请"}],
				approveId:'',
				radioList:[{"key":"repair/audit","value":"审核"},{"key":"repair/refused","value":"拒绝"}],
				imageList:['http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/09/10/image_1599669475_VQXiR1bX.jpg','http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/09/10/image_1599669475_VQXiR1bX.jpg','http://wephp-oa.oss-cn-shenzhen.aliyuncs.com/images/2020/09/10/image_1599669475_VQXiR1bX.jpg'],
				id: undefined,
			};
		},
		onShow() {
			this.initData();
		},
		onLoad(e) {
			this.danId = e.id;
			this.getOneDanData();
		},
		methods: {
			getOneDanData() {
				var that = this;
				uni.request({
				    url: 'http://49.234.32.81:8888/xboot/audit/getOne?id=' + that.danId,
					method: "GET",
				    success: (res) => {
						that.item = res.data.result;
				    },fail(e) {
				    	console.log(e);
				    }
				});
			},
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
			// 快速输入
			chooseMsg() {
				uni.showActionSheet({
					itemList: this.msgContents,
					success: res => {
						this.sendDate.suggest = this.msgContents[res.tapIndex];
					}
				});
			},

			async handleWorksOperation(status) {
				var that = this;
				console.log(status);
				if(status == 'repair/refused') {
					uni.request({
					    url: 'http://49.234.32.81:8888/xboot/audit/auditOne?id=' + that.danId+'&status=2&userName='+app.userData.nickname,
						method: "GET",
					    success: (res) => {
							uni.showToast({
								title:'拒绝成功'
							});
							that.item.status = 2;
					    },fail(e) {
					    	console.log(e);
					    }
					});
				} else if(status == 'repair/audit') {
					uni.request({
					    url: 'http://49.234.32.81:8888/xboot/audit/auditOne?id=' + that.danId+'&status=1&userName='+app.userData.nickname,
						method: "GET",
					    success: (res) => {
							uni.showToast({
								title:'通过成功'
							});
							that.item.status = 1;
					    },fail(e) {
					    	console.log(e);
					    }
					});
				}
				// this.$mHelper.toast('操作成功');
			},
		}
	};
</script>

<style lang="scss">
	.oa-notice-detail {
		.uni-timeline {
			padding: $spacing-lg;
			background-color: $color-white;
		}
		.feedback-title {
			display: flex;
			flex-direction: row;
			justify-content: space-between;
			align-items: center;
			padding: $spacing-base;
			margin-top: $spacing-base;
			font-size: $font-base;
		}

		.feedback-star-view.feedback-title {
			justify-content: flex-start;
			margin: 0;
		}

		.feedback-quick {
			position: relative;
			padding-right: 40upx;
			.iconfont {
				font-size: $font-sm;
			}
		}

		.feedback-body {
			background: $color-white;
			padding: $spacing-sm $spacing-base;
			.gender-item {
				margin-right: 20upx;

				.gender-item-text {
					padding-left: 10upx;
				}

				radio .wx-radio-input.wx-radio-input-checked {
					background: $uni-color-primary;
					border-color: $uni-color-primary;
				}
			}
		}

		.feedback-textare {
			height: 200upx;
			font-size: 34upx;
			line-height: 50upx;
			width: 100%;
			box-sizing: border-box;
			padding: 20upx 30upx 0;
		}
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	z-index: 98;
	width: 100%;
	background-color: $color-white;
	color: $font-color-base;
	box-shadow: 0 -1px 5px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 15upx $spacing-base;
	.action-btn {
		font-size: $font-sm;
		margin: 0 0 0 15upx;
		padding: 0 $spacing-lg;
		text-align: center;
		height: 60upx;
		line-height: 60upx;
	}
}
		.banner {
			overflow: hidden;
			position: relative;
			background-color: #ccc;

			.banner-img {
				height: 300upx;
				width: 100%;
			}

			.banner-title {
				max-height: 84upx;
				overflow: hidden;
				position: absolute;
				bottom: 0;
				width: 100%;
				font-size: 32upx;
				font-weight: 400;
				line-height: 42upx;
				color: white;
				z-index: 11;
				background-color: rgba(0, 0, 0, 0.25);
				padding: 4upx 20upx;
			}
		}

		.banner-title {
			padding: $spacing-lg $spacing-lg 0;
			font-size: $font-lg;
		}

		.article-meta {
			padding: 20upx 40upx;
			display: flex;
			flex-direction: row;
			justify-content: flex-start;
			color: gray;

			.article-text {
				font-size: 26upx;
				line-height: 50upx;
				margin: 0 20upx;
			}

			.article-author,
			.article-time {
				font-size: 30upx;
			}
		}

		.article-content {
			padding: 0 30upx;
			overflow: hidden;
			font-size: 30upx;
			margin-bottom: 30upx;
		}

.input-title {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	padding: $spacing-base;
	margin-top: $spacing-base;
	font-size: $font-base;

}

.input-body {
	background: $color-white;
	padding: $spacing-sm $spacing-base;
}
		.covers-title {
			display: flex;
			flex-direction: row;
			justify-content: space-between;
			align-items: center;
			padding: $spacing-base;
			margin-top: $spacing-base;
			font-size: $font-base;

		}
		.covers-body {
			background: $color-white;
			padding: $spacing-sm $spacing-base;
			.gender-item {
				margin-right: 20upx;

				.gender-item-text {
					padding-left: 10upx;
				}

				radio .wx-radio-input.wx-radio-input-checked {
					background: $uni-color-primary;
					border-color: $uni-color-primary;
				}
			}
		}
		.covers-uploader {
			padding: 22upx 20upx;
		}
	}
</style>
