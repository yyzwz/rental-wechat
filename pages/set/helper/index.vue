<template>
	<view class="helperList">
		<oa-empty info="暂无站点帮助"></oa-empty>
	</view>
</template>

<script>
import oaEmpty from '@/components/oa-empty';
export default {
	components: { oaEmpty},
	
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

<style lang="scss" scoped>
page {
	background-color: $page-color-base;
}
.helperList {
	margin-top: $spacing-base;
	.helper-child-item {
		margin: $spacing-base $spacing-lg;
		display: flex;
		justify-content: space-between;
	}
}
</style>
