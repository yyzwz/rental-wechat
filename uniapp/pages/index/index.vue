<template>
	<view class="wrap">
		<u-form :model="model" ref="uForm" :errorType="errorType">
			<u-form-item :label-position="labelPosition" label="车辆" label-width="120">
				<!-- <u-input :border="border" type="select" :select-open="selectCar" v-model="model.car" placeholder="请选择车辆" @click="selectCar = true"></u-input> -->
				<u-input :border="border" placeholder="请输入车牌号" v-model="model.car" type="text"></u-input>
			</u-form-item>
			<u-form-item label-width="120" :label-position="labelPosition" label="车主">
				<u-input :border="border" placeholder="请输入车主姓名" v-model="model.carOwner" type="text"></u-input>
			</u-form-item>
			<u-form-item label-width="120" :label-position="labelPosition" label="驾车人">
				<u-input :border="border" placeholder="请输入驾车人" v-model="model.jcr" type="text"></u-input>
			</u-form-item>
			<!-- <u-form-item label-width="120" :label-position="labelPosition" label="审核人">
				<u-input :border="border" placeholder="请输入审核人" v-model="model.shr" type="text"></u-input>
			</u-form-item> -->
			<!-- <u-form-item  label-width="120" :label-position="labelPosition" label="用车部门">
				<u-input :border="border" type="select" :select-open="selectDep" v-model="model.ycbm" placeholder="请选择车辆" @click="selectDep = true"></u-input>
				<u-input :border="border" placeholder="请输入部门" v-model="model.ycbm" type="text"></u-input>
			</u-form-item> -->
			<u-form-item  label-width="120" :label-position="labelPosition" label="开始时间">{{model.kssj}}
				<u-picker 
				mode="time"
				:params="params" 
				v-model="showKssj" 
				end-year="2030"
				@confirm="selectKssj"></u-picker>
				<u-button type="info" shape="square" size="mini" @click="showKssjFx">选择</u-button>
			</u-form-item>
			<u-form-item  label-width="120" :label-position="labelPosition" label="结束时间">{{model.jssj}}
				<u-picker
				mode="time"
				:params="params" 
				v-model="showJssj" 
				end-year="2030"
				@confirm="selectJssj"></u-picker>
				<u-button type="info" shape="square" size="mini" @click="showJssjFx">选择</u-button>
			</u-form-item>
			<u-form-item  label-width="120" :label-position="labelPosition" label="出车地点">
				{{model.ccdd}}
				<u-button type="info" shape="square" size="mini" @click="xzccdd">定位</u-button>
			</u-form-item>
			<u-form-item  label-width="120" :label-position="labelPosition" label="目的地">
				{{model.mdd}}
				<u-button type="info" shape="square" size="mini" @click="xzmdd">定位</u-button>
			</u-form-item>
			<u-form-item  label-width="120" :label-position="labelPosition" label="用车事由">
				<u-input :border="border" type="textarea" maxlength=100 height=150 placeholder="请输入用车事由" v-model="model.reason" auto-height></u-input>
			</u-form-item>
			<u-form-item :label-position="labelPosition" label="上传图片" prop="photo" label-width="150">
				<u-upload width="160" height="160"></u-upload>
			</u-form-item>
		</u-form>
		<u-button @click="submitFx">提交</u-button>
		<u-button @click="loginOut">退出</u-button>
		<u-select mode="single-column" :list="carList" v-model="selectCar" @confirm="selectCarConfirm"></u-select>
		<u-select mode="single-column" :list="depList" v-model="selectDep" @confirm="selectDepConfirm"></u-select>
	</view>
</template>

<script>
const app = getApp();
export default {
	data() {
		let that = this;
		return {
			params: {
				year: true,
				month: true,
				day: true,
				hour: true,
				minute: true,
				second: false,
				province: true,
				city: true,
				area: true,
				timestamp: true
			},
			showKssj: false,
			showJssj: false,
			token: '',
			model: {
				car: '',
				carOwner: '',
				jcr: '',
				kssj: '',
				jssj: '',
				ccdd: '',
				mdd: '',
				reason: ''
			},
			carList: [
				{
					value: '车辆A',
					label: '车辆A'
				},
				{
					value: '车辆B',
					label: '车辆B'
				},
				{
					value: '车辆C',
					label: '车辆C'
				}
			],
			depList: [
				{
					value: '总经办',
					label: '总经办'
				},
				{
					value: '人力资源部',
					label: '人力资源部'
				},
				{
					value: '财务部',
					label: '财务部'
				}
			],
			border: false,
			check: false,
			selectStatus: 'close',
			selectCar: false,
			selectDep: false,
			actionSheetShow: false,
			pickerShow: false,
			selectShow: false,
			radioCheckWidth: 'auto',
			radioCheckWrap: false,
			labelPosition: 'left',
			codeTips: '',
			errorType: ['message'],
		};
	},
	onLoad() {
	},
	onShow() {
		this.init();
		this.token = app.token;
	},
	computed: {
	},
	onReady() {
		this.$refs.uForm.setRules(this.rules);
	},
	methods: {
		init() {
			// this.getCarList();
		},
		loginOut() {
			uni.navigateTo({
				url:'../login/login'
			})
		},
		getCarList() {
			var that = this;
			console.log(app.token)
			uni.request({
			    url: 'http://49.234.32.81:8888/xboot/carArchives/getAll',
				method: "GET",
			    success: (res) => {
					console.log(res);
					that.carList = res.data.result;
			    },fail(e) {
			    	console.log(e);
			    }
			});
		},
		clearFrom() {
			var item = {
					car: '',
					carOwner: '',
					jcr: '',
					kssj: '',
					jssj: '',
					ccdd: '',
					mdd: '',
					reason: ''
				}
			this.model = item;
		},
		submitFx() {
			var that = this;
			uni.request({
			    url: 'http://49.234.32.81:8888/xboot/audit/addOnApp',
				method: "GET",
				header: {
					'content-type': 'application/json', 
					// "appToken": app.token,
				},
				dataType: 'json', 
				data:{
					userId: app.userData.id,
					car: that.model.car,
					carOwner: that.model.carOwner,
					jcr: that.model.jcr,
					kssj: that.model.kssj,
					jssj: that.model.jssj,
					ccdd: that.model.ccdd,
					mdd: that.model.mdd,
					reason: that.model.reason,
				},
			    success: (res) => {
					if(res.data.success) {
						that.clearFrom();
						uni.showToast({
							title:'申请成功',
						})
					}else {
						uni.showToast({
							title:'网络繁忙',
						})
					}
			    },fail(e) {
			    	console.log(e);
			    }
			});
		},
		showKssjFx() {
			this.showKssj = true;
		},
		showJssjFx() {
			this.showJssj = true;
		},
		xzccdd() {
			var that = this;
			uni.chooseLocation({
				success(res) {
					that.model.ccdd = res.name + "(" + res.address + ") 纬度:" + res.latitude + "经度:" + res.longitude;
				}
			});
		},
		xzmdd() {
			var that = this;
			uni.chooseLocation({
				success(res) {
					that.model.mdd = res.name + "(" + res.address + ") 纬度:" + res.latitude + "经度:" + res.longitude;
				}
			});
		},
		selectKssj(e) {
			var time = '';
			if (this.params.year) time += e.year;
			if (this.params.month) time += '-' + e.month;
			if (this.params.day) time += '-' + e.day;
			if (this.params.hour) time += ' ' + e.hour;
			if (this.params.minute) time += ':' + e.minute;
			if (this.params.second) time += ':' + e.second;
			this.model.kssj = time;
		},
		selectJssj(e) {
			var time = '';
			if (this.params.year) time += e.year;
			if (this.params.month) time += '-' + e.month;
			if (this.params.day) time += '-' + e.day;
			if (this.params.hour) time += ' ' + e.hour;
			if (this.params.minute) time += ':' + e.minute;
			if (this.params.second) time += ':' + e.second;
			this.model.jssj = time;
		},
		submit() {
			this.$refs.uForm.validate(valid => {
				if (valid) {
					if(!this.model.agreement) return this.$u.toast('请勾选协议');
					console.log('验证通过');
				} else {
					console.log('验证失败');
				}
			});
		},
		selectCarConfirm(e) {
			this.model.car = e[0].value;
		},
		selectDepConfirm(e) {
			this.model.ycbm = e[0].value;
		},
	}
};
</script>

<style scoped lang="scss">
.wrap {
	padding: 30rpx;
}

.agreement {
	display: flex;
	align-items: center;
	margin: 40rpx 0;

	.agreement-text {
		padding-left: 8rpx;
		color: $u-tips-color;
	}
}
</style>
