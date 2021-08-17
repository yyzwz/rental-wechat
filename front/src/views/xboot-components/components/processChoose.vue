<template>
  <div>
    <Alert type="warning" show-icon
      >流程审批通用状态及结果保存至ActBusiness表中，添加业务时记得向该表中关联表ID等数据，参考开发文档工作流部分</Alert
    >
    <Divider class="component-blue" orientation="left"
      >工作流程选择发起</Divider
    >
    <div style="font-size: 12px; margin-bottom: 10px">
      示例（此处传入actBusinessId属性值为测试数据123456，所以会报错）：
    </div>
    <Button @click="showProcessChoose = true">发起流程</Button>
    <h3 class="component-article">基础用法</h3>
    基本用法，使用
    <code>v-model</code>
    实现数据的双向绑定（组件显示），显示组件前记得传入有效属性值：actBusinessId。
    <h3 class="component-article">props</h3>
    <Table
      :columns="props"
      :data="data1"
      border
      size="small"
      width="1000"
    ></Table>
    <h3 class="component-article">events</h3>
    <Table
      :columns="events"
      :data="data2"
      border
      size="small"
      width="1000"
    ></Table>

    <!-- 流程选择组件 -->
    <process-choose v-model="showProcessChoose" actBusinessId="123456" />
  </div>
</template>
<script>
import { props, events, methods } from "./columns";
import processChoose from "@/views/my-components/xboot/process-choose";
export default {
  components: {
    processChoose,
  },
  data() {
    return {
      props: props,
      events: events,
      methods: methods,
      showProcessChoose: false,
      data1: [
        {
          name: "value",
          desc: "绑定的值，可使用 v-model 双向绑定",
          type: "String",
          value: "空",
        },
        {
          name: "actBusinessId",
          desc:
            "流程关联业务表id，显示组件前务必给该属性传入actBusinessId数据值",
          type: "String",
          value: "空",
        },
      ],
      data2: [
        {
          name: "on-submit",
          type: "Boolean",
          value: "仅成功提交申请触发返回true，用于刷新表单显示审批状态",
        },
      ],
    };
  },
  methods: {},
  mounted() {},
};
</script>