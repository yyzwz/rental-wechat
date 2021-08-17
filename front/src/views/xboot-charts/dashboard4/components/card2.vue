<template>
  <div>
    <Card :padding="0" class="dashboard4-card2">
      <div class="info-wrap">
        <div class="title-content">
          <div class="title">创建CRM报表报告</div>
          <div class="desc">系统将根据项目自动生成报告</div>
        </div>
        <Button
          type="info"
          size="large"
          to="http://xpay.exrick.cn/pay?xboot"
          target="_blank"
          >立即开始</Button
        >
      </div>
    </Card>
  </div>
</template>

<script>
export default {
  name: "card2",
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
<style lang="less">
.dashboard4-card2 {
  height: 150px;
  padding: 24px 28px;
  display: flex;
  align-items: center;
  width: 100%;
  .ivu-card-body {
    width: 100%;
  }
  .info-wrap {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    .title-content {
      display: flex;
      flex-direction: column;
      .title {
        font-size: 20px;
        color: #3f4254;
        font-weight: 600;
        margin-bottom: 5px;
      }
      .desc {
        color: #7e8299;
      }
    }
  }
}
</style>