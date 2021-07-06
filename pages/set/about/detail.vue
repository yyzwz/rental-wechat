<template>
	<view class="about" >
		<view class="shop-info " v-if="title === '关于我们'">
			<view class="about-content" v-if="detail.about_me">
				<oa-parser lazy-load :html="detail.about_me"></oa-parser>
			</view>
			<oa-empty :info="`暂无${title}`" v-if="!detail.about_me "></oa-empty>
		</view>
		<view class="shop-info " v-if="title === '注册协议'">
			<view class="about-content" v-if="detail.protocol_register">
				<oa-parser lazy-load :html="detail.protocol_register"></oa-parser>
			</view>
			<oa-empty :info="`暂无${title}`" v-if="!detail.protocol_register "></oa-empty>
		</view>
		<view class="shop-info" v-if="title === '隐私协议'">
			<view class="about-content" v-if="detail.protocol_privacy">
				<oa-parser lazy-load :html="detail.protocol_privacy"></oa-parser>
			</view>
			<oa-empty :info="`暂无${title}`" v-if="!detail.protocol_privacy "></oa-empty>
		</view>

	</view>
</template>

<script>
	import oaParser from '@/components/oa-parser';
	import oaEmpty from '@/components/oa-empty';
	export default {
		components: {
			oaParser,oaEmpty
		},
		data() {
			return {
				detail: {"about_me":"<p></p><p>办公系统主要为国内企业提供办公自动化信息服务，功能为如：工作流自定义，个人中心(通讯录、我的日志、我的日程、我的总结)；信息中心(新闻动态、下载中心、公告管理)、学习中心(制度管理、业务知识、安全知识)；工作审批(报修管理、报销管理、用车申请、请假管理、加班管理、出差管理、申购管理、申领管理)、资产管理、车辆管理、档案管理、人事管理(员工信息、合同管理、奖惩管理、社保管理、)、考勤管理(班次管理、排班管理、我的排班、签到签退)、后勤管理、巡更巡检、公告管理、日常管理、巡更巡检(地点管理、巡更班次、巡更计划、我的排班、巡更记录)、意见反馈、站点帮助、在线客服功能模块。</p><p><br/></p>"},
				title: null,
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
		onLoad(options) {
			this.title = options.title;
			uni.setNavigationBarTitle({
				title: options.title
			});
		},
		
	};
</script>
<style lang="scss">
	page {
		background-color: $page-color-base;
		position: relative;

		.about {
			.shop-info {
				.about-content {
					padding: $spacing-lg;
				}

				text-align: left;

				image {
					margin-top: 100upx;
					width: 240upx;
					height: 240upx;
					border-radius: 50%;
				}
			}
		}
	}
</style>
