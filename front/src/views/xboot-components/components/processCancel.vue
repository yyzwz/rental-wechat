<template>
  <div>
    <Divider class="component-blue" orientation="left">取消撤回申请</Divider>
    <div style="font-size: 12px; margin-bottom: 10px">
      示例（此处传入的属性actBusinessId和流程实例procInstId均为测试数据123456，所以会报错）：
    </div>
    <Button @click="showProcessCancel = true">撤回申请</Button>
    <h3 class="component-article">基础用法</h3>
    基本用法，使用
    <code>v-model</code>
    实现数据的双向绑定（组件显示），显示组件前记得传入有效属性值：procInstId和actBusinessId。
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

    <process-cancel
      v-model="showProcessCancel"
      actBusinessId="123456"
      procInstId="123456"
    />
  </div>
</template>
<script>
import { props, events, methods } from "./columns";
import processCancel from "@/views/my-components/xboot/process-cancel";
export default {
  components: {
    processCancel,
  },
  data() {
    return {
      props: props,
      events: events,
      methods: methods,
      showProcessCancel: false,
      data1: [
        {
          name: "processKey",
          desc: "流程标识Key，显示组件前务必给该属性传入processKey数据值",
          type: "String",
          value: "空",
        },
        {
          name: "procInstId",
          desc: "流程实例表id，显示组件前务必给该属性传入procInstId数据值",
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