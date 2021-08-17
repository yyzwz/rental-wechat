<template>
  <div class="dashboard-page">
    <Row :gutter="20">
      <Col :sm="24" :md="12" :lg="6">
        <cardBar
          id="income"
          title="总收入"
          :value="25134"
          prefix="￥"
          compare="1.08%"
          class="margin"
        />
      </Col>
      <Col :sm="24" :md="12" :lg="6">
        <cardArea
          id="out"
          title="总支出"
          :value="3456"
          status="down"
          compare="0.83%"
          class="margin"
        />
      </Col>
      <Col :sm="24" :md="12" :lg="6">
        <cardRadial
          id="order"
          title="订单总数"
          :value="35268"
          status="down"
          compare="6.13%"
          class="margin"
        />
      </Col>
      <Col :sm="24" :md="12" :lg="6">
        <cardLine
          id="users"
          title="用户增长"
          :value="13.68"
          prefix="+"
          compare="10.68%"
          suffix="%"
          class="margin"
        />
      </Col>
    </Row>
    <Row :gutter="20">
      <Col :sm="24" :lg="24" :xl="16">
        <LineChart class="margin" />
      </Col>
      <Col :sm="24" :lg="24" :xl="8">
        <cardButton class="margin" />
        <cardProgress class="margin" />
      </Col>
    </Row>
    <Row>
      <Col :lg="24" :xl="24">
        <orderTable class="margin" />
      </Col>
    </Row>
  </div>
</template>

<script>
import cardBar from "./components/cardBar.vue";
import cardArea from "./components/cardArea.vue";
import cardRadial from "./components/cardRadial.vue";
import cardLine from "./components/cardLine.vue";
import LineChart from "./components/line.vue";
import cardButton from "./components/cardButton.vue";
import cardProgress from "./components/cardProgress.vue";
import orderTable from "./components/orderTable.vue";
export default {
  name: "dashboard-3",
  components: {
    cardBar,
    cardArea,
    cardRadial,
    cardLine,
    cardButton,
    cardProgress,
    LineChart,
    orderTable,
  },
  data() {
    return {
    };
  },
  methods: {
    init() {},
  },
  mounted() {
    this.init();
  },
};
</script>
<style lang="less" scoped>
.dashboard-page {
  .margin {
    margin-bottom: 20px;
  }
}
</style>