<template>
  <div class="foot">
    <Row type="flex" justify="center" class="copyright">
      Copyright © 2021 - 云谷档案管理系统
      <a href="https://www.baidu.com" target="_blank" style="margin: 0 5px"
        >云谷</a
      >
      {{ $t("rights") }}
    </Row>
  </div>
</template>

<script>
export default {
  name: "xboot-footer",
};
</script>

<style lang="less">
.foot {
  width: 100%;
  margin: 48px 0 24px;
  color: rgba(0, 0, 0, 0.45);
  font-size: 14px;
  .foot-item {
    margin: 0 auto;
    margin-bottom: 1vh;
    width: 60%;
    .item {
      color: rgba(0, 0, 0, 0.45);
    }
    :hover {
      color: rgba(0, 0, 0, 0.65);
    }
  }
}
</style>
