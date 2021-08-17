<template>
  <div class="card-line">
    <Card :padding="20">
      <div class="title-content">
        <div class="title">销售数据分析</div>
        <div>
          <Dropdown class="sortby" @on-click="sortBy = $event">
            <span>
              {{ sortBy }}
              <Icon type="ios-arrow-down"></Icon>
            </span>
            <DropdownMenu slot="list">
              <DropdownItem name="按年统计">按年统计</DropdownItem>
              <DropdownItem name="按月统计">按月统计</DropdownItem>
              <DropdownItem name="按周统计">按周统计</DropdownItem>
            </DropdownMenu>
          </Dropdown>
        </div>
      </div>
      <div class="data-content">
        <div class="item">
          <div class="important">￥1385</div>
          <div class="desc">营业额</div>
        </div>
        <div class="item">
          <div class="data">186</div>
          <div class="desc">销售量</div>
        </div>
        <div class="item">
          <div class="data">3.8%</div>
          <div class="desc">同比增长</div>
        </div>
      </div>
      <div class="chart">
        <apexchart
          type="line"
          height="380"
          :options="chartOptions"
          :series="series"
        />
      </div>
    </Card>
  </div>
</template>

<script>
var zh = require("../../../../libs/zh.json");
export default {
  name: "line-chart",
  components: {},
  props: {},
  data() {
    return {
      sortBy: "按年统计",
      series: [
        {
          name: "",
          data: [],
        },
      ],
      chartOptions: {
        colors: ["#5b73e8", "#dee2e5", "#feaf1a"],
        chart: {
          stacked: false,
          toolbar: {
            show: false,
          },
          locales: [zh],
          defaultLocale: "zh",
        },
        stroke: {
          width: [0, 2, 4],
          curve: "smooth",
        },
        plotOptions: {
          bar: {
            columnWidth: "50%",
          },
        },
        fill: {
          opacity: [0.85, 0.25, 1],
          gradient: {
            inverseColors: false,
            shade: "light",
            type: "vertical",
            opacityFrom: 0.85,
            opacityTo: 0.55,
            stops: [0, 100, 100, 100],
          },
        },
        markers: {
          size: 0,
        },
        xaxis: {
          labels: {
            formatter: function (value) {
              return value + "月";
            },
          },
          categories: [
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10",
            "11",
            "12",
          ],
        },
        yaxis: {
          title: {
            text: "销售量",
            style: {
              color: "#bac2c7",
            },
          },
          labels: {
            show: true,
            style: {
              colors: ["#bac2c7"],
            },
          },
          min: 0,
        },
        tooltip: {
          shared: true,
          intersect: false,
        },
        dataLabels: {
          enabled: false,
        },
        grid: {
          show: false,
        },
        legend: {
          offsetY: 5,
        },
      },
    };
  },
  methods: {
    init() {
      this.series = [
        {
          name: "PC端",
          type: "column",
          data: [23, 11, 22, 27, 13, 22, 37, 21, 44, 22, 30, 35],
        },
        {
          name: "移动端",
          type: "area",
          data: [44, 55, 41, 67, 22, 43, 21, 41, 56, 27, 43, 47],
        },
        {
          name: "平板端",
          type: "line",
          data: [30, 25, 36, 30, 45, 35, 64, 52, 59, 36, 39, 45],
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
  .title-content {
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 16px;
    font-weight: 600;
    color: #495057;
    margin-bottom: 24px;
    .sortby {
      font-size: 14px;
      cursor: pointer;
      font-weight: 400;
      color: #74788d;
    }
  }
  .data-content {
    display: flex;
    .item {
      display: flex;
      align-items: baseline;
      padding: 2px 20px;
      .important {
        color: #5b73e8;
        font-weight: 500;
        font-size: 24px;
        margin-right: 16px;
      }
      .data {
        color: #495057;
        font-weight: 500;
        font-size: 24px;
        margin-right: 16px;
      }
      .desc {
        color: #74788d;
        font-size: 15px;
        font-weight: 500;
      }
    }
  }
}
</style>