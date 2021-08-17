<template>
  <div>
    <Card :padding="0" :bordered="false" class="card5">
      <div class="title-content">
        <div class="title">销售目标</div>
        <Dropdown trigger="click">
          <Icon type="md-more" color="#fff" size="26" class="more"></Icon>
          <DropdownMenu slot="list">
            <DropdownItem>查看详情</DropdownItem>
            <DropdownItem>更多操作</DropdownItem>
          </DropdownMenu>
        </Dropdown>
      </div>
      <apexchart
        type="bar"
        height="200"
        :options="chartOptions"
        :series="series"
      ></apexchart>
      <div class="white-content">
        <div class="row">
          <div class="title-item">
            <div class="desc">平均每天销售</div>
            <div class="data">￥1650.65</div>
          </div>
          <div class="title-item">
            <div class="desc">本月目标</div>
            <div class="data">$63650</div>
          </div>
        </div>
        <div class="row">
          <div class="title-item">
            <div class="desc">手续费/税收</div>
            <div class="data">￥13650.13</div>
          </div>
          <div class="title-item">
            <div class="desc">净收入</div>
            <div class="data">$86650.87</div>
          </div>
        </div>
      </div>
    </Card>
  </div>
</template>

<script>
var zh = require("../../../../libs/zh.json");
export default {
  name: "card4",
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
        colors: ["#fc8f99", "#fff"],
        chart: {
          type: "bar",
          toolbar: {
            show: false,
          },
          sparkline: {
            enabled: true,
          },
          locales: [zh],
          defaultLocale: "zh",
        },
        plotOptions: {
          bar: {
            horizontal: false,
            columnWidth: "30%",
            endingShape: "rounded",
          },
        },
        dataLabels: {
          enabled: false,
        },
        stroke: {
          show: true,
          width: 2,
          colors: ["transparent"],
        },
        xaxis: {
          categories: [
            "一月",
            "五月",
            "六月",
            "九月",
            "十月",
            "十一月",
            "十二月",
          ],
        },
        yaxis: {
          min: 0,
        },
        fill: {
          opacity: 1,
        },
        tooltip: {
          y: {
            formatter: function (val) {
              return "￥ " + val;
            },
          },
        },
      },
    };
  },
  methods: {
    init() {
      this.series = [
        {
          name: "净利润",
          data: [44, 55, 57, 56, 61, 58, 63],
        },
        {
          name: "营业额",
          data: [76, 85, 101, 98, 87, 105, 91],
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
.card5 {
  height: 500px;
  background-color: #f64e61;
  background-image: radial-gradient(
    circle,
    rgba(255, 226, 230, 0.4),
    #f64e61 70%
  );
  .title-content {
    padding: 24px 28px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 10px;
    .title {
      font-size: 17px;
      font-weight: 600;
      color: #fff;
    }
    .more {
      font-size: 14px;
      cursor: pointer;
    }
  }
  .white-content {
    background: #fff;
    border-radius: 5px 5px 4px 4px;
    padding: 24px 28px;
    height: 217px;
    .row {
      display: flex;
      align-items: center;
      .title-item {
        height: 85px;
        width: 50%;
        padding: 24px 28px;
        .desc {
          color: #b5b5c3;
          font-size: 12px;
        }
        .data {
          font-size: 17px;
          font-weight: 600;
          color: #3f4255;
        }
      }
    }
  }
}
</style>