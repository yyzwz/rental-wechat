<template>
  <div>
    <Card
      :padding="0"
      class="card1"
      :bordered="false"
      :style="{
        backgroundImage:
          'url(' + require('@/assets/dashboard/architecture.jpg') + ')',
      }"
    >
      <div class="info-wrap">
        <a class="title">应用配置</a>
      </div>
    </Card>
  </div>
</template>

<script>
export default {
  name: "card1",
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
.card1 {
  background-size: cover;
  .info-wrap {
    display: flex;
    height: 150px;
    padding: 20px 28px;
    .title {
      display: flex;
      font-size: 20px;
      color: #3f4255;
      font-weight: 600;
      height: 40px;
      &:hover {
        color: #6993ff;
      }
    }
  }
}
</style>