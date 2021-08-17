<template>
  <div>
    <Card :padding="0" class="card-bar">
      <div class="info-wrap">
        <div class="top">
          <div class="left">
            <div>
              <span class="mt">{{ prefix }}</span>
              <span class="mt" :id="id"></span>
              <span class="mt">{{ suffix }}</span>
            </div>
            <h6 class="text">{{ title }}</h6>
          </div>
          <div class="right-chart">
            <apexchart
              type="bar"
              height="40"
              width="70"
              :options="chartOptions"
              :series="series"
            />
          </div>
        </div>
        <div class="bottom">
          <Icon
            type="md-arrow-round-up"
            color="#34c38f"
            size="20"
            v-if="status == 'up'"
          />
          <Icon type="md-arrow-round-down" size="20" color="#f46a6a" v-else />
          <span :class="`compare-${status}`">{{ compare }}</span>
          <span class="since">{{ since }}</span>
        </div>
      </div>
    </Card>
  </div>
</template>

<script>
import { CountUp } from "countup.js";
var zh = require("../../../../libs/zh.json");
export default {
  name: "card-bar",
  components: {},
  props: {
    id: {
      type: String,
      default: "countup",
    },
    title: {
      type: String,
      default: "-",
    },
    value: {
      type: Number,
      default: 0,
    },
    prefix: String,
    suffix: String,
    status: {
      type: String,
      default: "up",
    },
    compare: String,
    since: {
      type: String,
      default: "与上周相比",
    },
  },
  data() {
    return {
      series: [
        {
          data: [],
        },
      ],
      chartOptions: {
        colors: ["#47a1ff"],
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
        plotOptions: {
          bar: {
            columnWidth: "50%",
          },
        },
        labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
        tooltip: {
          fixed: {
            enabled: false,
          },
          x: {
            show: false,
          },
          y: {
            title: {
              formatter: function (seriesName) {
                return "";
              },
            },
          },
          marker: {
            show: false,
          },
        },
      },
    };
  },
  methods: {
    init() {
      this.$nextTick(() => {
        let demo = new CountUp(this.id, this.value);
        if (!demo.error) {
          demo.start();
        }
      });
      this.series = [
        {
          data: [2, 5, 7, 4, 9, 7, 5, 2, 3, 5, 6],
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
.card-bar {
  .info-wrap {
    display: flex;
    align-items: center;
    flex-direction: column;
    height: 132px;
    padding: 20px;
    .top {
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: flex-end;
      .left {
        .mt {
          color: #495057;
          font-size: 22px;
          font-weight: 500;
        }
        .text {
          color: #74788d;
          font-weight: 400;
          font-size: 14px;
        }
      }
    }
    .bottom {
      width: 100%;
      display: flex;
      color: #74788d;
      margin-top: 16px;
      .compare-up {
        color: #34c38f;
        font-size: 15px;
        margin-right: 8px;
        font-weight: 500;
      }
      .compare-down {
        color: #f46a6a;
        font-size: 15px;
        margin-right: 8px;
        font-weight: 500;
      }
      .since {
        color: #74788d;
      }
    }
  }
}
</style>