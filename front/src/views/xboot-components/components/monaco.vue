<template>
  <div>
    <Divider class="component-blue" orientation="left"
      >Monaco 代码编辑器</Divider
    >
    <Alert type="info" show-icon>
      基于
      <a href="https://github.com/microsoft/monaco-editor" target="_blank"
        >Monaco Editor</a
      >
      封装，已配置好中文，支持v-model双向绑定，属性配置等。
    </Alert>
    <monaco
      language="javascript"
      v-model="data"
      height="300"
      style="width: 1000px"
    />

    <h3 class="component-article">基础用法</h3>
    使用
    <code>v-model</code>
    实现数据的双向绑定。单页面同时使用两个及以上该组件时，需设定不同的id值加以区分。
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
import monaco from "@/views/my-components/xboot/monaco";
export default {
  components: {
    monaco,
  },
  data() {
    return {
      data: "function hello() {\n\talert('Hello world!');\n}",
      props: props,
      events: events,
      methods: methods,
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
            "代码编辑器的id值，用于绑定代码编辑器，当同时使用两个及以上该组件时，需设定不同的id值加以区分",
          type: "String",
          value: "monaco",
        },
        {
          name: "height",
          desc: "编辑器的高度层级，默认为500，单位px",
          type: "Number | String",
          value: "500",
        },
        {
          name: "language",
          desc:
            "代码语言，支持的语言有：'abap', 'apex', 'azcli', 'bat', 'cameligo', 'clojure', 'coffee', 'cpp', 'csharp', 'csp', 'css', 'dart', 'dockerfile', 'fsharp', 'go', 'graphql', 'handlebars', 'hcl', 'html', 'ini', 'java', 'javascript', 'json', 'julia', 'kotlin', 'less', 'lexon', 'lua', 'markdown', 'mips', 'msdax', 'mysql', 'objective-c', 'pascal', 'pascaligo', 'perl', 'pgsql', 'php', 'postiats', 'powerquery', 'powershell', 'pug', 'python', 'r', 'razor', 'redis', 'redshift', 'restructuredtext', 'ruby', 'rust', 'sb', 'scala', 'scheme', 'scss', 'shell', 'solidity', 'sophia', 'sql', 'st', 'swift', 'systemverilog', 'tcl', 'twig', 'typescript', 'vb', 'xml', 'yaml'",
          type: "String",
          value: "空",
        },
        {
          name: "lineNumbers",
          desc: "是否显示行号，开启'on'，关闭'off'",
          type: "String",
          value: "on",
        },
        {
          name: "readOnly",
          desc: "是否只读（无法编辑）",
          type: "Boolean",
          value: "false",
        },
        {
          name: "cursorStyle",
          desc:
            "光标样式，可选值有'line' | 'block' | 'underline' | 'line-thin' | 'block-outline' | 'underline-thin'",
          type: "String",
          value: "line",
        },
        {
          name: "fontSize",
          desc: "字体大小",
          type: "Number",
          value: "12",
        },
        {
          name: "showThemeChange",
          desc: "是否显示右下角主题切换开关",
          type: "Boolean",
          value: "true",
        },
      ],
      data2: [
        {
          name: "on-change",
          type: "返回编辑器代码内容",
          value: "value（编辑器代码内容）",
        },
      ],
      data3: [
        {
          name: "setData",
          type: "设置编辑器代码内容",
          value: "你要传入的内容，示例 setData(data)",
        },
        {
          name: "layout",
          type: "自动重新布局编辑器宽度",
          value: "无",
        },
      ],
    };
  },
  methods: {
    init() {},
  },
  mounted() {
    this.init();
  },
};
</script>