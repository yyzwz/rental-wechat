<template>
  <div>
    <Card :padding="0" class="card-area">
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
              type="area"
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
export default {
  name: "card-area",
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
        colors: ["#34c38f"],
        chart: {
          sparkline: {
            enabled: true,
          },
        },
        stroke: {
          width: 2,
          curve: "smooth",
        },
        fill: {
          opacity: 0.3,
        },
        xaxis: {
          crosshairs: {
            width: 1,
          },
        },
        yaxis: {
          min: 0,
          max: 8
        },
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
          data: [2, 3, 4, 3, 5, 4, 5, 6, 5],
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
.card-area {
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