<template>
	<view class="oa-notice-detail">
		数据参数是：{{id}}
		<view class="article-meta">
			<text class="article-author">维博网络</text>
			<text class="article-text">发布于</text>
			<text class="article-time">2020-12-12</text>
		</view>
		<view class="article-content">
			<oa-parser lazy-load :html="announceDetail.content"></oa-parser>
		</view>
	</view>
</template>

<script>
	import oaParser from '@/components/oa-parser';
	export default {
		components: {
			oaParser,
		},
		props:['id'],//-获得参数方法2
		data() {
			return {
				announceDetail: {
					"id": 1,
					"merchant_id": 2,
					"title": "明天下午三点开会",
					"content": "<p>目前，各企业、项目陆续进入复工复产阶段，人流物流明显增加，特别是省外及省内市外来靖返靖人员密集增多，返回人员疫病的自我防护意识不强和企业疫情防控的主体责任意识不强并存，疫情防控工作面临新形势、新情况和新挑战。各乡镇、部门、园区、企业和项目主管单位要坚决贯彻落实习近平总书记关于疫情防控工作的一系列指示精神和中央、省、市部署要求，高度重视企业、项目复工复产和疫情防控工作。要在防控措施到位的前提下，精细、稳妥、慎重、有序地推进企业和项目复工复产，坚决做到疫情防控和复工复产“两手抓、两手硬、两不误！</p><p>（一）建立疫情防控体系。各企业、项目业主要按照县疫情联防联控领导小组要求制定复工复产疫情防控方案、防控应急预案、安全生产方案等，在省级疫情一级响应解除前复工的企业，要落实法人负责制，复工复产后建立主要负责人负总责的疫情防控工作机制，明确目标任务，细化具体措施，落实人员责任，建立全环节、全流程疫情防控台账，形成从企业、项目管理层到车间班组、一线职工的疫情防控全员责任体系</p><p>（二）全力做好防疫物资储备。企业、项目复工前，需根据县疫情联防联控领导小组的要求做好疫情防控准备工作，落实专门疫情防控管控人员、设立测温点、临时隔离室、配备防护口罩、消毒液、红外线测温仪等疫情防控物资，有集体宿舍的企业和项目部要配置必要的临时隔离宿舍。结合复工前安全生产与职业健康培训教育，通过微信、网络等多种有效形式，组织开展新冠肺炎防控知识和警示教育，提高员工自我防护意识和能力。同时注重发挥已有医务室的作用，配备必要的药物和防护物资。未设立医务室的企业应主动与就近的医疗机构进行联系。</p>",
					"type": 1,
					"target_id": 0,
					"target_type": "",
					"target_display": 1,
					"action": "",
					"view": 0,
					"sender_id": 68,
					"sender_display": 1,
					"sender_withdraw": 1,
					"status": 1,
					"created_at": 1601906116,
					"updated_at": 1601906116
				},
			};
		},
		onLoad: function (option) { //option为object类型，会序列化上个页面传递的参数
			console.log('--------获得参数方法1--------------------');
			console.log(option.id); //打印出上个页面传递的参数。
			console.log(option.title); //打印出上个页面传递的参数。
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


	};
</script>

<style lang="scss">
	.oa-notice-detail {
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
			padding: 20upx 30upx;
			display: flex;
			flex-direction: row;
			justify-content: flex-start;
			color: gray;

			.article-text {
				font-size: 30upx;
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
	}
</style>
