<template>
  <div>
    <Divider class="component-blue" orientation="left"
      >通过流程key直接发起最新版本</Divider
    >
    <div style="font-size: 12px; margin-bottom: 10px">
      示例（此处传入的属性流程key为请假申请leave，传入actBusinessId为测试数据123456，所以会报错）：
    </div>
    <Button @click="showProcessStart = true" :loading="processLoading"
      >发起流程</Button
    >
    <h3 class="component-article">基础用法</h3>
    基本用法，使用
    <code>v-model</code>
    实现数据的双向绑定（组件显示），显示组件前记得传入有效属性值：processKey和actBusinessId。
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

    <process-start
      v-model="showProcessStart"
      processKey="leave"
      actBusinessId="123456"
      @on-loading="processLoading = true"
      @on-loaded="processLoading = false"
    />
  </div>
</template>
<script>
import { props, events, methods } from "./columns";
import processStart from "@/views/my-components/xboot/process-start";
export default {
  components: {
    processStart,
  },
  data() {
    return {
      props: props,
      events: events,
      methods: methods,
      showProcessStart: false,
      processLoading: false,
      data1: [
        {
          name: "value",
          desc: "绑定的值，可使用 v-model 双向绑定",
          type: "String",
          value: "空",
        },
        {
          name: "processKey",
          desc: "流程标识Key，显示组件前务必给该属性传入processKey数据值",
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
          name: "on-loading",
          type: "Boolean",
          value: "加载中状态，传入key后需加载流程信息，加载中触发返回true",
        },
        {
          name: "on-loaded",
          type: "Boolean",
          value: "加载完毕状态，传入key后需加载流程信息，加载完毕触发返回true",
        },
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