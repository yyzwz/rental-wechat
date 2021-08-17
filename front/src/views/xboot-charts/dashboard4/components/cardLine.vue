<template>
  <div>
    <Card :padding="0" class="card-line">
      <div class="title-content">
        <div>
          <div class="title">本周销售数据</div>
          <div class="title-desc">本周攻击销售数量：128650</div>
        </div>
        <Dropdown trigger="click">
          <Icon type="md-more" color="#b5b5c1" size="26" class="more"></Icon>
          <DropdownMenu slot="list">
            <DropdownItem>查看详情</DropdownItem>
            <DropdownItem>更多操作</DropdownItem>
          </DropdownMenu>
        </Dropdown>
      </div>
      <apexchart
        type="area"
        height="120"
        :options="chartOptions"
        :series="series"
      />
      <div class="pay-content">
        <div class="pay-item">
          <div class="pay-item-left">
            <img src="@/assets/icon/alipay.png" class="icon" />
            <div class="pay-title-content">
              <div class="title">支付宝</div>
              <div class="desc">同比上周增长￥1456</div>
            </div>
          </div>
          <div class="money">+5868￥</div>
        </div>
        <div class="pay-item">
          <div class="pay-item-left">
            <img src="@/assets/icon/wechatpay.png" class="icon" />
            <div class="pay-title-content">
              <div class="title">微信支付</div>
              <div class="desc">同比上周增长￥156</div>
            </div>
          </div>
          <div class="money">+4688￥</div>
        </div>
        <div class="pay-item">
          <div class="pay-item-left">
            <img src="@/assets/icon/applepay.png" class="icon" />
            <div class="pay-title-content">
              <div class="title">Apple Pay</div>
              <div class="desc">同比上周增长￥856</div>
            </div>
          </div>
          <div class="money">+1358￥</div>
        </div>
        <div class="pay-item">
          <div class="pay-item-left">
            <img src="@/assets/icon/yinlian.png" class="icon" />
            <div class="pay-title-content">
              <div class="title">银联/云闪付</div>
              <div class="desc">同比上周增长￥16</div>
            </div>
          </div>
          <div class="money">+198￥</div>
        </div>
      </div>
    </Card>
  </div>
</template>

<script>
var zh = require("../../../../libs/zh.json");
export default {
  name: "card-line",
  components: {},
  props: {},
  data() {
    return {
      series: [
        {
          name: "",
          data: [],
        },
      ],
      chartOptions: {
        colors: ["#ff455f"],
        chart: {
          toolbar: {
            show: false,
          },
          sparkline: {
            enabled: true,
          },
          locales: [zh],
          defaultLocale: "zh",
        },
        dataLabels: {
          enabled: false,
        },
        fill: {
          opacity: 0.1,
          type: "gradient",
          gradient: {
            shadeIntensity: 1,
            opacityFrom: 0.3,
            opacityTo: 0.5,
            stops: [0, 50],
          },
        },
        stroke: {
          width: 3,
          curve: "smooth",
        },
        labels: [...Array(12).keys()].map((n) => `2019-11-${n + 1}`),
        yaxis: {
          min: 0,
          max: 60,
        },
        xaxis: {
          type: "datetime",
        },
        tooltip: {
          enabled: true,
          x: {
            show: true,
            format: "MMM dd日",
          },
        },
      },
    };
  },
  methods: {
    init() {
      this.series = [
        {
          name: "销售额",
          data: [47, 45, 54, 48, 56, 48, 55, 45, 37, 39, 52, 51],
        },
      ];
    },
  },
  mounted() {
    this.init();
  },
};
</script>
<style lang="less" scoped>
.card-line {
  height: 515px;
  .title-content {
    padding: 24px 28px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    .title {
      font-size: 17px;
      font-weight: 600;
      color: #3f4255;
      margin-bottom: 10px;
    }
    .title-desc {
      color: #b5b5c3;
      font-size: 12px;
    }
    .more {
      font-size: 14px;
      cursor: pointer;
      color: #74788d;
    }
  }
  .pay-content {
    display: flex;
    flex-direction: column;
    width: 100%;
    padding: 0 24px;
    .pay-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      height: 50px;
      margin-bottom: 20px;
      .pay-item-left {
        display: flex;
        align-items: center;
        height: 100%;
      }
      .icon {
        width: 50px;
        height: 50px;
        background-color: #f3f6f8;
        margin-right: 20px;
      }
      .pay-title-content {
        display: flex;
        flex-direction: column;
        height: 42px;
        justify-content: space-between;
        .title {
          font-size: 15px;
          font-weight: 600;
          color: #3f4255;
        }
        .desc {
          color: #b5b5c3;
          font-size: 12px;
        }
      }
      .money {
        padding: 2px 6px;
        color: #7e8298;
        background-color: #f3f6f8;
        border-radius: 5px;
      }
    }
  }
}
</style>