<template>
  <div>
    <!-- Drawer抽屉 -->
    <Drawer
      :title="title"
      v-model="visible"
      width="630"
      draggable
      :mask-closable="type == '0'"
    >
      <div :style="{ maxHeight: maxHeight }" class="drawer-content">
        <Form
          ref="form"
          :model="form"
          :rules="formValidate"
          label-position="top"
        >
          <Row :gutter="32">
            <Col span="24">
              <FormItem label="问题标题" prop="title">
                <Input v-model="form.title" clearable />
              </FormItem>
            </Col>
          </Row>
          <Row :gutter="32">
            <Col span="24">
              <FormItem
                label="关键词（额外触发词 若问题中已包含可无需填写 多个以任意符号分隔）"
                prop="keywords"
              >
                <Input
                  v-model="form.keywords"
                  type="textarea"
                  :rows="5"
                  clearable
                />
              </FormItem>
            </Col>
          </Row>
          <Row :gutter="32">
            <Col span="24">
              <FormItem label="回答" prop="content" class="form-editor">
                <editor
                  ref="editor"
                  v-model="form.content"
                  height="200"
                ></editor>
              </FormItem>
            </Col>
          </Row>
          <Row :gutter="32">
            <Col span="24">
              <FormItem
                label="权重值（值越大越靠前，支持小数）"
                prop="sortOrder"
              >
                <InputNumber
                  v-model="form.sortOrder"
                  style="width: 100%"
                ></InputNumber>
              </FormItem>
            </Col>
          </Row>
          <Row :gutter="32">
            <Col span="24">
              <FormItem label="热门回答" prop="hot">
                <div style="display: flex; align-items: center">
                  <i-switch v-model="form.hot">
                    <span slot="open">是</span>
                    <span slot="close">否</span>
                  </i-switch>
                  <Tooltip
                    content="开启后将在“猜你想问”中显示热门hot标记"
                    placement="right"
                    transfer
                    max-width="280"
                    style="display: inline-block !important"
                  >
                    <Icon
                      type="md-help-circle"
                      size="20"
                      color="#c5c5c5"
                      style="margin-left: 10px; cursor: pointer"
                    />
                  </Tooltip>
                </div>
              </FormItem>
            </Col>
          </Row>
          <Row :gutter="32">
            <Col span="24">
              <FormItem label="启用反馈（允许赞踩）" prop="evaluable">
                <i-switch v-model="form.evaluable">
                  <span slot="open">开</span>
                  <span slot="close">关</span>
                </i-switch>
              </FormItem>
            </Col>
          </Row>
          <Row :gutter="32">
            <Col span="24">
              <FormItem label="点赞数" prop="good">
                <InputNumber
                  v-model="form.good"
                  style="width: 100%"
                ></InputNumber>
              </FormItem>
            </Col>
          </Row>
          <Row :gutter="32">
            <Col span="24">
              <FormItem label="踩数" prop="bad">
                <InputNumber
                  v-model="form.bad"
                  style="width: 100%"
                ></InputNumber>
              </FormItem>
            </Col>
          </Row>
        </Form>
      </div>
      <div class="drawer-footer br" v-show="type != '0'">
        <Button type="primary" :loading="submitLoading" @click="submit"
          >提交</Button
        >
        <Button @click="visible = false">取消</Button>
      </div>
    </Drawer>
  </div>
</template>

<script>
// 根据你的实际请求api.js位置路径修改
import { addReply, editReply } from "@/api/autoChat";
import editor from "@/views/my-components/xboot/editor";
export default {
  name: "addEdit",
  components: {
    editor,
  },
  props: {
    value: {
      type: Boolean,
      default: false,
    },
    data: {
      type: Object,
    },
    type: {
      type: String,
      default: "0",
    },
  },
  data() {
    return {
      visible: this.value,
      title: "",
      submitLoading: false,
      maxHeight: 510,
      form: {
        // 添加或编辑表单对象初始化数据
        title: "",
        keywords: "",
        content: "",
        good: 0,
        bad: 0,
        sortOrder: 0,
        hot: false,
        evaluable: true,
      },
      // 表单验证规则
      formValidate: {
        title: [{ required: true, message: "不能为空", trigger: "change" }],
        content: [{ required: true, message: "不能为空", trigger: "change" }],
      },
    };
  },
  methods: {
    init() {},
    submit() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          if (this.type == "1") {
            // 编辑
            this.submitLoading = true;
            editReply(this.form).then((res) => {
              this.submitLoading = false;
              if (res.success) {
                this.$Message.success("操作成功");
                this.$emit("on-submit", true);
                this.visible = false;
              }
            });
          } else {
            // 添加
            this.submitLoading = true;
            addReply(this.form).then((res) => {
              this.submitLoading = false;
              if (res.success) {
                this.$Message.success("操作成功");
                this.$emit("on-submit", true);
                this.visible = false;
              }
            });
          }
        }
      });
    },
    setCurrentValue(value) {
      if (value === this.visible) {
        return;
      }
      if (this.type == "1") {
        this.title = "编辑";
        this.maxHeight =
          Number(document.documentElement.clientHeight - 121) + "px";
      } else if (this.type == "2") {
        this.title = "添加";
        this.maxHeight =
          Number(document.documentElement.clientHeight - 121) + "px";
      } else {
        this.title = "详细信息";
        this.maxHeight = "100%";
      }
      // 清空数据
      this.$refs.form.resetFields();
      if (this.type == "0" || this.type == "1") {
        // 回显数据处理
        this.form = this.data;
      } else {
        // 添加
        delete this.form.id;
      }
      this.visible = value;
    },
  },
  watch: {
    value(val) {
      this.setCurrentValue(val);
    },
    visible(value) {
      this.$emit("input", value);
    },
  },
  mounted() {
    this.init();
  },
};
</script>

<style lang="less">
@import "@/styles/drawer-common.less";
</style>