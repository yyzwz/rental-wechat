<template>
  <div>
    <Card :padding="0" :bordered="false" class="card-button">
      <div class="info-wrap">
        <div class="left">
          <div class="title">
            立即获取<b>完整版</b>获得更多的功能
            <Icon type="md-arrow-forward" />
          </div>
          <Button to="http://xpay.exrick.cn/pay?xboot" target="_blank" type="success" style="width: 130px">升级账户</Button>
        </div>
        <img class="right" src="@/assets/dashboard/process.png"/>
      </div>
    </Card>
  </div>
</template>

<script>
export default {
  name: "card-button",
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
.card-button {
  background: #5b73e8;
  .info-wrap {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 175px;
    padding: 20px;
    .left {
      height: 115px;
      width: 220px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      .title {
        color: #fff;
        font-size: 18px;
      }
    }
    .right {
      height: 130px;
      width: 150px;
    }
  }
}
</style>