<template>
  <div>
    <Card
      :padding="0"
      class="card5"
      :bordered="false"
      :style="{
        backgroundImage: 'url(' + require('@/assets/dashboard/earth.jpg') + ')',
      }"
    >
      <div class="info-wrap">
        <div class="title-content">使用移动端App<br />创建数据报表</div>
        <div class="desc">立即使用App <Icon type="md-arrow-forward" size="16" style="margin-left: 5px"/></div>
      </div>
    </Card>
  </div>
</template>

<script>
export default {
  name: "card4",
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
.card5 {
  background-size: cover;
  height: 345px;
  padding: 24px 28px;
  .info-wrap {
    height: 289px;
    width: 160px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    .title-content {
      font-size: 20px;
      color: #fff;
      font-weight: 600;
    }
    .desc {
      display: flex;
      align-items: center;
      color: #ffa801;
      cursor: pointer;
    }
  }
}
</style>