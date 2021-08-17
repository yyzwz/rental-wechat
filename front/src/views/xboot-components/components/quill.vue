<template>
  <div>
    <Alert type="warning" show-icon>即将移除废弃该组件，请使用基于wangEditor封装的富文本组件</Alert>
    <Alert type="info" show-icon>
      基于
      <a href="https://github.com/quilljs/quill" target="_blank">quill</a>
      封装。已配置好中文、图片上传(上传至XBoot文件服务或Base64)。扩展编辑HTML代码、全屏预览、清空、XSS攻击过滤等。
    </Alert>
    <quill id="quill" v-model="quillData"></quill>
    <h3 class="component-article">基础用法</h3>
    使用
    <code>v-model</code>
    实现数据的双向绑定。单页面同时使用两个及以上该组件时，需设定不同的id值加以区分。
    <h3 class="component-article">样式冲突</h3>
    在 <code>FormItem</code> 中使用时，建议在该标签上加上
    <code>class="form-noheight"</code>。
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
    <h3 class="component-article">methods</h3>
    <Table
      :columns="methods"
      :data="data3"
      border
      size="small"
      width="1000"
    ></Table>
  </div>
</template>
<script>
import { props, events, methods } from "./columns";
import quill from "@/views/my-components/xboot/quill";
export default {
  components: {
    quill,
  },
  data() {
    return {
      props: props,
      events: events,
      methods: methods,
      quillData:
        '<img src="http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a1/2018new_doge02_org.png" alt="[doge]">',
      data1: [
        {
          name: "value",
          desc: "绑定的值，可使用 v-model 双向绑定",
          type: "String",
          value: "空",
        },
        {
          name: "id",
          desc:
            "富文本的id值，用于绑定富文本编辑器，当同时使用两个及以上该组件时，需设定不同的id值加以区分",
          type: "String",
          value: "editor",
        },
        {
          name: "height",
          desc: "富文本高度，默认300px",
          type: "String",
          value: "300px",
        },
        {
          name: "base64",
          desc:
            "是否使用base64保存图片，默认false上传至XBoot配置的文件存储服务中，不推荐使用base64存储",
          type: "Boolean",
          value: "false",
        },
        {
          name: "expandHtml",
          desc: "是否显示顶部扩展 编辑Html代码 按钮",
          type: "Boolean",
          value: "true",
        },
        {
          name: "expandPreview",
          desc: "是否显示顶部扩展 预览 按钮",
          type: "Boolean",
          value: "true",
        },
        {
          name: "expandClear",
          desc: "是否显示顶部扩展 清空 按钮",
          type: "Boolean",
          value: "true",
        },
        {
          name: "openXss",
          desc:
            "是否打开XSS过滤，注意！开启后将默认过滤掉样式，请自行添加白名单",
          type: "Boolean",
          value: "false",
        },
      ],
      data2: [
        {
          name: "on-change",
          type: "返回富文本编辑器内容",
          value: "value（富文本编辑器内容）",
        },
      ],
      data3: [
        {
          name: "setData",
          type: "设置富文本编辑器内容",
          value: "你要传入的内容，示例 setData(data)",
        },
      ],
    };
  },
  methods: {},
  mounted() {},
};
</script>