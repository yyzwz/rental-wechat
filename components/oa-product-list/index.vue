<template>
	<view class="oa-product-list">
		<view class="oa-product-list-container">
			<block v-for="(item, index) in list" :key="index">
				<view v-if="(index + 1) % 2 !== 0 || isList" class="oa-product-item" @tap.stop="navTo(`/pages/product/product?id=${item.id}`)"
				 :class="[isList ? 'oa-product-flex-list' : '']" hover-class="hover" :hover-start-time="150">
					<view class="oa-product-image-wrapper">
						<image :src="item.cover" mode="widthFix" :preview="false" :class="[isList?'oa-product-list-img':'oa-product-img']"></image>
						<!-- <text class="sketch in1line">{{ item.sketch }}</text>
						<view class="triangle-wrapper">
							<image class="triangle-tag" :src="item | filterTagName"></image>
						</view> -->
					</view>
					<view class="oa-pro-content">
						<view class="oa-pro-tit">{{ item.title }}</view>
						<view>
							<!-- <view class="oa-pro-price" v-if="item.price">
								<text class="oa-sale-price" :class="'text-'+themeColor.name">{{ moneySymbol }}{{ item.price }}</text>
								<text class="oa-factory-price" v-if="item.market_price > item.price">{{ moneySymbol }}{{ item.market_price }}</text>
							</view> -->
							<!-- <view class="oa-pro-pay" v-if="item">
								<text><text :class="'text-'+themeColor.name">{{
										item.total_sales | filterTotalSales
									}}</text>
									人付款</text>
								<text @tap.stop="toggleSpec(item)" class="iconfont icongouwuche2" :class="'text-'+themeColor.name"></text>
							</view> -->
						</view>
					</view>
				</view>
			</block>
		</view>
		<view class="oa-product-list-container" v-if="!isList">
			<block v-for="(item, index) in list" :key="index">
				<view v-if="(index + 1) % 2 === 0" class="oa-product-item" @tap.stop="navTo(`/pages/product/product?id=${item.id}`)"
				 :class="[isList ? 'oa-product-flex-list' : '']" hover-class="hover" :hover-start-time="150">
					<view class="oa-product-image-wrapper">
						<image :src="item.cover" mode="widthFix" :preview="false" :class="[isList?'oa-product-list-img':'oa-product-img']"></image>
						<!-- <text class="sketch in1line">{{ item.sketch }}</text>
						<view class="triangle-wrapper" v-if="item.shipping_type === '1' || item.is_virtual === '1' || item.commissionRate || item.is_open_presell === '1'">
							<image class="triangle-tag" :src="item | filterTagName"></image>
						</view> -->
					</view>
					<view class="oa-pro-content">
						<view class="oa-pro-tit">{{ item.title }}</view>
						<!-- <view>
							<view class="oa-pro-price" v-if="item.price">
								<text class="oa-sale-price" :class="'text-'+themeColor.name">{{ moneySymbol }}{{ item.price }}</text>
								<text class="oa-factory-price" v-if="item.market_price > item.price">{{ moneySymbol }}{{ item.market_price }}</text>
							</view>
							<view class="oa-pro-pay" v-if="item">
								<text><text :class="'text-'+themeColor.name">{{
										item.total_sales | filterTotalSales
									}}</text>
									付款</text>
								<text @tap.stop="toggleSpec(item)" :class="'text-'+themeColor.name" class="iconfont icongouwuche2"></text>
							</view>
						</view> -->
					</view>
				</view>
			</block>
		</view>
		<!-- 规格-模态层弹窗 -->
		<view class="popup spec show" v-if="specClass === 'show'" @touchmove.stop.prevent="stopPrevent" @tap="hideSpec">
			<!-- 遮罩层 -->
			<view class="mask" @tap="hideSpec"></view>
			<view class="layer" :style="{bottom: bottom ? `${bottom}upx` : 0}" @tap.stop="stopPrevent">
				<oa-attr-content :product="productDetail" @toggle="toggleSpec" :showBuyBtn="true"></oa-attr-content>
			</view>
		</view>
	</view>
</template>

