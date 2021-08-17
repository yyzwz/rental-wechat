<template>
  <div>
    <Card
      :padding="0"
      class="card3"
      :bordered="false"
      :style="{
        backgroundImage:
          'url(' + require('@/assets/dashboard/people.png') + ')',
      }"
    >
      <div class="info-wrap">
        <div class="title">创建SaaS应用<br />并制作数据报表</div>
        <Button
          type="success"
          size="large"
          style="width: 130px"
          to="http://xpay.exrick.cn/pay?xboot"
          target="_blank"
          >创建应用</Button
        >
      </div>
    </Card>
  </div>
</template>

<script>
export default {
  name: "card3",
  components: {},
  props: {},
  data() {
    return {};
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
.card3 {
  background-size: 40% auto;
  background-position: 95% 50%;
  background-repeat: no-repeat;
  background-color: #6f42c1;
  height: 175px;
  padding: 24px 28px;
  .info-wrap {
    display: flex;
    flex-direction: column;
    .title {
      font-size: 20px;
      font-weight: 600;
      color: #fff;
      margin-bottom: 20px;
    }
  }
}
</style>