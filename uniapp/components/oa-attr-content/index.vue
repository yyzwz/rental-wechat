<template>
	<view class="attr-content">
		<view class="a-t">
			<image class="image" mode="widthFix" :src="picture || product.picture"></image>
			<view class="right">
				<text class="title in2line">{{ product.name }}</text>
				<view class="sku-info-wrapper">
					<view class="price-wrapper">
						<image mode="aspectFit" class="image" v-if="product.memberDiscount && product.memberDiscount.length !== 0 && product.memberDiscount.discount > 0 && price > 0" :src="vipPrice"></image>
						<text :class="'text-' + themeColor.name" v-if="price">{{ moneySymbol }}{{ currentProductPrice }}</text>
					</view>
					<text class="stock" v-if="stock">库存：{{ stock }}{{ product.unit || '件' }}</text>
					<view class="selected in2line" v-if="specSelected.length > 0">
						已选：
						<text
							class="selected-text"
							v-for="(sItem, sIndex) in specSelected"
							:key="sIndex"
						>
							{{ sItem.title }}
						</text>
						<text v-if="specSelected.length > 0"> * {{ cartCount }} </text>
					</view>
				</view>
			</view>
		</view>
		<scroll-view class="attr-content-scroll-view" scroll-y>
			<view v-for="(item, index) in specList" :key="index" class="attr-list">
				<text>{{ item.title }}</text>
				<view class="item-list">
					<view
						v-for="(childItem, childIndex) in specChildList"
						:key="childIndex"
						@tap="
							selectSpec(childIndex, childItem.base_spec_id, item.show_type)
						"
					>
						<view
							v-if="childItem.base_spec_id === item.base_spec_id"
							:class="[childItem.selected ? 'bg-' + themeColor.name : 'tit-normal', childItem.disabled ? 'disabled' : '']"
							:style="
								childItem.selected && parseInt(item.show_type) === 2
									? styleObject
									: ''
							"
							class="tit"
						>
							<text v-if="parseInt(item.show_type) === 1">
								{{ childItem.title }}
							</text>
							<text v-if="parseInt(item.show_type) === 2">
								{{ childItem.title }}
							</text>
							<view v-if="parseInt(item.show_type) === 3">
								<image
									class="img"
									:src="childItem.data || product.picture"
									mode="aspectFill"
								></image>
								{{ childItem.title }}
							</view>
						</view>
					</view>
				</view>
			</view>
			<view class="select-count" v-if="isSelectedNum">
				<text>购买数量</text>
<!--				<oa-number-box-->
<!--					v-if="parseInt(stock || product.stock, 10) === 0"-->
<!--					class="step"-->
<!--					:disabled="true"-->
<!--					:min="0"-->
<!--					:max="0"-->
<!--					@eventChange="numberChange"-->
<!--				></oa-number-box>-->
				<oa-number-box
					class="step"
					:min="parseInt(product.min_buy, 10) || minNum"
					:max="parseInt(product.max_buy, 10) || (maxNum === 0 ? parseInt(stock || product.stock, 10) : maxNum)"
					:value="cartCount"
					@eventChange="numberChange"
				></oa-number-box>
<!--					:max="parseInt(stock || product.stock, 10)"-->
			</view>
		</scroll-view>
		<button v-if="!showBuyBtn" class="btn" :class="'bg-' + themeColor.name" @tap="toggleSpec">完成</button>
		<view class="btn-group" v-else>
			<button class="btn" :class="'bg-' + themeColor.name" @tap="toggleSpec(1)">加入购物车</button>
			<button class="btn" :class="'bg-' + themeColor.name" @tap="toggleSpec(2)">立即购买</button>
		</view>
	</view>
</template>

<style scoped lang="scss">
	.sku-info-wrapper {
		width: 100%;
		padding-bottom: $spacing-sm;
	}
	.price-wrapper {
		height: 38upx;
		display: flex;
		align-items: center;
		margin: $spacing-sm 0;
		.image {
			width: 120upx;
			height: 38upx;
		}
		.base-color {
			margin-top: 2upx;
		}
	}
	.btn-group {
		display: flex;
		justify-content: space-between;
		.btn {
			width: 40vw;
		}
	}
</style>
