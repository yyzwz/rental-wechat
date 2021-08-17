<template>
  <div>
    <Card :padding="0" class="card5">
      <div class="title-content">
        <div class="title">销售数据分析</div>
        <Icon type="md-refresh" color="#869ac1" size="20" class="refresh"></Icon>
      </div>
      <div class="title-desc">本周销售数据详情图表</div>
      <apexchart
        type="line"
        height="400"
        :options="chartOptions"
        :series="series"
      ></apexchart>
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
          data: [],
        },
      ],
      chartOptions: {
        chart: {
          type: "line",
          id: "line-chart",
          locales: [zh],
          defaultLocale: "zh",
        },
        annotations: {
          yaxis: [
            {
              y: 8200,
              borderColor: "#775DD0",
              label: {
                borderColor: "#775DD0",
                style: {
                  color: "#fff",
                  background: "#775DD0",
                },
                text: "投入线",
              },
            },
            {
              y: 8600,
              y2: 9000,
              borderColor: "#000",
              fillColor: "#FEB019",
              opacity: 0.1,
              label: {
                borderColor: "#FEB019",
                style: {
                  fontSize: "10px",
                  color: "#333",
                  background: "#FEB019",
                },
                text: "盈利范围",
              },
            },
          ],
          xaxis: [
            {
              x: new Date("2021-01-08").getTime(),
              strokeDashArray: 0,
              borderColor: "#000",
              label: {
                borderColor: "#000",
                style: {
                  color: "#fff",
                  background: "#000",
                },
                text: "标记线",
              },
            },
            {
              x: new Date("2021-01-10").getTime(),
              x2: new Date("2021-01-12").getTime(),
              fillColor: "#B3F7CA",
              opacity: 0.5,
              label: {
                borderColor: "#19be6b",
                style: {
                  fontSize: "10px",
                  color: "#fff",
                  background: "#19be6b",
                },
                offsetY: -6,
                text: "广告投入",
              },
            },
          ],
          points: [
            {
              x: new Date("2021-01-15").getTime(),
              y: 8607.55,
              marker: {
                size: 8,
                fillColor: "#fff",
                strokeColor: "red",
                radius: 2,
                cssClass: "apexcharts-custom-class",
              },
              label: {
                borderColor: "#FF4560",
                offsetY: 0,
                style: {
                  color: "#fff",
                  background: "#FF4560",
                },
                text: "受损转折点",
              },
            },
          ],
        },
        dataLabels: {
          enabled: false,
        },
        stroke: {
          curve: "straight",
        },
        grid: {
          padding: {
            right: 30,
            left: 20,
          },
        },
        labels: [...Array(20).keys()].map((n) => `2021-01-${n + 1}`),
        xaxis: {
          type: "datetime",
          labels: {
            datetimeFormatter: {
              year: "yyyy年",
              month: "yyyy年MMM",
              day: "MMMdd日",
            },
          },
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
          name: "销售金额",
          data: [
            8107.85,
            8128.0,
            8122.9,
            8165.5,
            8340.7,
            8423.7,
            8423.5,
            8514.3,
            8481.85,
            8487.7,
            8506.9,
            8626.2,
            8668.95,
            8602.3,
            8607.55,
            8512.9,
            8496.25,
            8600.65,
            8881.1,
            9340.85,
          ],
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
  padding: 20px;
  .title-content {
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 17px;
    font-weight: 600;
    color: #3f4255;
    margin-bottom: 10px;
    .refresh {
      font-size: 14px;
      cursor: pointer;
      color: #74788d;
    }
  }
  .title-desc {
    color: #3f4255;
    font-weight: 500;
  }
  .refresh {
    cursor: pointer;
  }
}
</style>