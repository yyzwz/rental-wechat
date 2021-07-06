<template>
	<view class="page">
		<view class="input-title ">
			<text>审核状态</text>
			<template >
				<template>审核</template>
			</template>
		</view>
		<view class="input-title ">
			<text>报修分类</text>
			<template >
				<template >资产报修</template>
			</template>
		</view>
		<view class="input-title">
			<text>报修内容</text>
		</view>
		<view class="input-body">
			<textarea v-model="repairDetail.content" class="input-textare" />
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
						{{item.name}} {{ item.suggest }} {{ item.time}}
					</view>
				</view>
			</view>
		</view>
	</view>
</template>
<script>
import { repair ,workState,getRepairType} from '@/api/basic';
import moment from '@/common/moment';

export default {
	data() {
		return {
			repairDetail: {"id":4,"merchant_id":2,"member_id":69,"cate_id":1,"content":"日常报修,2222","log":[{"id":68,"time":1602174818,"action":"repair/approve","suggest":"好好好的","name":"系统管理员","approve":"审批"},{"id":69,"time":1602174760,"action":"repair/audit","suggest":"好的","name":"古月","approve":"审核"},{"id":69,"time":1602174747,"action":"repair/apply","suggest":"提交申请","name":"古月","approve":"申请"}],"remind":0,"sort":0,"state":"approve","status":"repair/approve","created_at":1602174747,"updated_at":1602174818},
			approveDetail:[{"id":68,"time":'2020-12-12:12:12:12',"action":"repair/approve","suggest":"好好好的","name":"系统管理员","approve":"审批"},{"id":69,"time":'2020-12-12:12:12:12',"action":"repair/audit","suggest":"好的","name":"古月","approve":"审核"},{"id":69,"time":'2020-12-12:12:12:12',"action":"repair/apply","suggest":"提交申请","name":"古月","approve":"申请"}],
			imageList: [],
			id: undefined,
			loading: true
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
	
	methods: {

	}
};
</script>
<style lang="scss">
page {
	background-color: $page-color-base;
}
.uni-timeline {
			padding: $spacing-lg;
			background-color: $color-white;
		}
/*问题反馈*/
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

.input-textare {
	height: 200upx;
	font-size: 34upx;
	line-height: 50upx;
	width: 100%;
	box-sizing: border-box;
	padding: 20upx 30upx 0;
}

</style>
