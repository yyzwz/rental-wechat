<template>
  <div>
    <Card class="chat">
      <Row :gutter="20">
        <Col :md="24" :lg="12">
          <div class="setting-content">
            <div class="setting-title">智能助手页面配置</div>
            <Tabs v-model="tabName">
              <TabPane label="基础配置" name="basic"></TabPane>
              <TabPane label="输入框" name="quick"></TabPane>
              <TabPane label="公告" name="notice"></TabPane>
              <TabPane label="反馈" name="feedback"></TabPane>
              <TabPane label="未知答复" name="system"></TabPane>
            </Tabs>
            <div style="position: relative">
              <Form
                ref="emailForm"
                :model="form"
                :label-width="120"
                label-position="left"
                :rules="formValidate"
              >
                <div v-show="tabName == 'basic'">
                  <FormItem label="对话框标题名称" prop="title">
                    <Input
                      type="text"
                      v-model="form.title"
                      placeholder="请输入对话框标题名称"
                    />
                  </FormItem>
                  <FormItem label="机器人头像" prop="avatar" class="form-noheight">
                    <uploadPicInput v-model="form.avatar" />
                  </FormItem>
                  <FormItem label="进入系统提示" prop="sysMessage">
                    <Input
                      type="text"
                      v-model="form.sysMessage"
                      placeholder="请输入进入系统提示"
                    />
                  </FormItem>
                  <FormItem label="初始消息" prop="welcomeMessage">
                    <Input
                      type="textarea"
                      :rows="5"
                      v-model="form.welcomeMessage"
                      placeholder="请输入点踩后显示的文本"
                    />
                  </FormItem>
                  <FormItem label="初始富文本消息" prop="initMessage">
                    <editor
                      id="initMessage"
                      v-model="form.initMessage"
                      height="150"
                    />
                  </FormItem>
                </div>
                <div v-show="tabName == 'quick'">
                  <FormItem label="输入框占位文本" prop="placeholder">
                    <Input
                      type="text"
                      v-model="form.placeholder"
                      placeholder="请输入输入框占位文本"
                    />
                  </FormItem>
                  <FormItem label="快捷短语" prop="quickReplies">
                    <vuedraggable
                      :list="tagList"
                      :animation="200"
                      ghost-class="thumb-ghost"
                    >
                      <Tag
                        size="large"
                        closable
                        v-for="(item, index) in tagList"
                        :key="index"
                        :color="item.isHighlight ? 'blue' : 'default'"
                        :class="{ 'ivu-close-color': item.isHighlight }"
                        @click.native="editQuickReply(item)"
                        @on-close="handleDelete(item)"
                        ><span v-if="item.icon">[{{ item.icon }}] </span
                        >{{ item.name }}</Tag
                      >
                    </vuedraggable>
                    <div style="display: flex; align-items: center">
                      <Button
                        icon="md-add"
                        type="dashed"
                        @click="addQuickReply"
                        style="margin-top: 5px"
                        >添加快捷短语</Button
                      >
                      <Tooltip
                        content="点击短语可编辑，可拖拽交换顺序"
                        placement="right"
                        transfer
                        max-width="280"
                        style="
                          display: inline-block !important;
                          padding-top: 5px;
                        "
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
                </div>
                <div v-show="tabName == 'notice'">
                  <FormItem label="公告开关" prop="noticeType">
                    <i-switch
                      v-model="form.noticeType"
                      :true-value="'richtext'"
                      :false-value="''"
                    >
                      <span slot="open">开</span>
                      <span slot="close">关</span>
                    </i-switch>
                    <Tooltip
                      content="开启后将在PC端的右侧显示公告内容"
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
                  </FormItem>
                  <FormItem label="公告标题" prop="noticeTitle">
                    <Input
                      type="text"
                      v-model="form.noticeTitle"
                      placeholder="请输入公告标题"
                    />
                  </FormItem>
                  <FormItem label="公告内容" prop="noticeContent">
                    <editor
                      id="noticeContent"
                      v-model="form.noticeContent"
                      height="250"
                    />
                  </FormItem>
                </div>
                <div v-show="tabName == 'feedback'">
                  <FormItem label="点赞后反馈文本" prop="textOfGood">
                    <Input
                      type="textarea"
                      :rows="5"
                      v-model="form.textOfGood"
                      placeholder="请输入点赞后显示的文本"
                    />
                  </FormItem>
                  <FormItem label="点踩后反馈文本" prop="textOfBad">
                    <Input
                      type="textarea"
                      :rows="5"
                      v-model="form.textOfBad"
                      placeholder="请输入点踩后显示的文本"
                    />
                  </FormItem>
                </div>
                <div v-show="tabName == 'system'">
                  <FormItem label="未找到任何匹配回答的答复" prop="noDataReply">
                    <editor
                      id="noDataReply"
                      v-model="form.noDataReply"
                      height="250"
                    />
                  </FormItem>
                </div>
                <FormItem>
                  <Button
                    type="primary"
                    style="width: 100px"
                    :loading="saveLoading"
                    @click="submit"
                    >保存更改</Button
                  >
                </FormItem>
              </Form>
              <Spin fix v-if="loading"></Spin>
            </div>
          </div>
        </Col>
        <Col :md="24" :lg="12" class="iphone-content">
          <div
            class="demo-model"
            :style="{
              backgroundImage:
                'url(' + require('@/assets/icon/iPhoneX.png') + ')',
            }"
          >
            <div class="model-content">
              <iframe
                scrolling="auto"
                frameborder="0"
                :src="demoUrl"
                id="demo-modal"
                class="iframe"
              ></iframe>
            </div>
          </div>
        </Col>
      </Row>
      <div class="preview-pc" @click="showDemo(true)">
        <Icon type="md-desktop" style="margin-right: 5px" />预览PC版
      </div>
    </Card>

    <Modal
      :title="modalTitle"
      v-model="modalVisible"
      :mask-closable="false"
      :width="500"
    >
      <Form
        ref="replyForm"
        :model="replyForm"
        label-position="top"
        :rules="replyFormValidate"
      >
        <FormItem label="快捷短语" prop="name">
          <Input v-model="replyForm.name" />
        </FormItem>
        <FormItem label="图标" prop="icon">
          <Select filterable v-model="replyForm.icon" clearable>
            <Option value="alarm">闹钟 alarm</Option>
            <Option value="apps">应用 apps</Option>
            <Option value="bullhorn">喇叭 bullhorn</Option>
            <Option value="camera">相机 camera</Option>
            <Option value="cart">购物车 cart</Option>
            <Option value="close">关闭 close</Option>
            <Option value="check">确认 check</Option>
            <Option value="edit">编辑 edit</Option>
            <Option value="ellipsis-h">更多 ellipsis-h</Option>
            <Option value="file">文件 file</Option>
            <Option value="folder">文件夹 folder</Option>
            <Option value="home">首页 home</Option>
            <Option value="image">图片 image</Option>
            <Option value="info-circle">提示 info-circle</Option>
            <Option value="keyboard">键盘 keyboard</Option>
            <Option value="message">消息 message</Option>
            <Option value="mic">麦克风 mic</Option>
            <Option value="paper-plane">发送 paper-plane</Option>
            <Option value="plus">加号 plus</Option>
            <Option value="refresh">刷新 refresh</Option>
            <Option value="search">搜索 search</Option>
            <Option value="share">分享 share</Option>
            <Option value="smile">笑脸 smile</Option>
            <Option value="tel">电话 tel</Option>
            <Option value="thumbs-down">点赞 thumbs-down</Option>
            <Option value="thumbs-up">点踩 thumbs-up</Option>
          </Select>
        </FormItem>
        <FormItem label="高亮显示" prop="isHighlight">
          <i-switch v-model="replyForm.isHighlight">
            <span slot="open">开</span>
            <span slot="close">关</span>
          </i-switch>
        </FormItem>
        <FormItem label="右上角红点" prop="isNew">
          <i-switch v-model="replyForm.isNew">
            <span slot="open">开</span>
            <span slot="close">关</span>
          </i-switch>
        </FormItem>
      </Form>
      <div slot="footer">
        <Button type="text" @click="modalVisible = false">取消</Button>
        <Button type="primary" @click="handleSubmit">提交</Button>
      </div>
    </Modal>
  </div>
</template>

<script>
import { getAutoChatSet, editAutoChatSet, getOtherSet } from "@/api/index";
import editor from "@/views/my-components/xboot/editor";
import uploadPicInput from "@/views/my-components/xboot/upload-pic-input";
import vuedraggable from "vuedraggable";
export default {
  name: "chat-setting",
  components: {
    editor,
    uploadPicInput,
    vuedraggable,
  },
  data() {
    return {
      tabName: "basic",
      loading: false, // 表单加载状态
      saveLoading: false,
      form: {
        noticeType: ""
      },
      formValidate: {},
      modalType: 0, // 添加或编辑标识
      modalVisible: false, // 添加或编辑显示
      modalTitle: "", // 添加或编辑标题
      replyForm: {
        name: "",
        icon: "",
        isHighlight: false,
        isNew: false,
      },
      replyFormValidate: {
        name: [{ required: true, message: "不能为空", trigger: "blur" }],
      },
      tagList: [],
      domain: "",
      demoUrl: "",
    };
  },
  methods: {
    init() {
      this.getData();
      this.initUrl();
    },
    getData() {
      this.loading = true;
      getAutoChatSet().then((res) => {
        this.loading = false;
        if (res.success) {
          if (res.result) {
            // 转换null为""
            let v = res.result;
            for (let attr in v) {
              if (v[attr] == null || v[attr] == "null") {
                v[attr] = "";
              }
            }
            let str = JSON.stringify(v);
            let data = JSON.parse(str);
            this.form = data;
            if (
              res.result.quickReplies &&
              res.result.quickReplies.length >= 0 &&
              res.result.quickReplies != "null"
            ) {
              this.tagList = JSON.parse(res.result.quickReplies);
            }
          }
        }
      });
    },
    initUrl() {
      getOtherSet().then((res) => {
        if (res.result) {
          this.domain = res.result.domain;
          this.showDemo();
        }
      });
    },
    showDemo(previewPC) {
      if (!this.domain) {
        this.$Modal.confirm({
          title: "您还未配置访问域名",
          content:
            "您还未配置应用部署访问域名，是否现在立即去配置?（配置后请刷新该页面）",
          onOk: () => {
            this.$router.push({
              name: "setting",
              query: { name: "other" },
            });
          },
        });
        return;
      }
      this.demoUrl = `${this.domain}/chat/chat.html?accessToken=${this.getStore(
        "accessToken"
      )}&time=${new Date()}`;
      if (previewPC) {
        window.open(this.demoUrl);
      }
    },
    addQuickReply() {
      this.modalType = 0;
      this.modalTitle = "添加快捷短语";
      this.$refs.replyForm.resetFields();
      this.modalVisible = true;
    },
    editQuickReply(v) {
      this.modalType = 1;
      this.modalTitle = "编辑快捷短语";
      // 转换null为""
      for (let attr in v) {
        if (v[attr] == null) {
          v[attr] = "";
        }
      }
      let str = JSON.stringify(v);
      let data = JSON.parse(str);
      this.replyForm = data;
      this.modalVisible = true;
    },
    handleDelete(v) {
      this.tagList = this.tagList.filter((e) => {
        return e.name != v.name;
      });
    },
    handleSubmit() {
      this.$refs.replyForm.validate((valid) => {
        if (valid) {
          if (this.modalType == 0) {
            // 添加
            this.tagList.push({
              id: new Date().getTime(),
              name: this.replyForm.name,
              icon: this.replyForm.icon,
              isHighlight: this.replyForm.isHighlight,
              isNew: this.replyForm.isNew,
            });
            this.modalVisible = false;
          } else {
            // 编辑
            for (let i = 0; i < this.tagList.length; i++) {
              if (this.tagList[i].id == this.replyForm.id) {
                this.tagList[i] = this.replyForm;
              }
            }
            this.modalVisible = false;
          }
        }
      });
    },
    submit() {
      this.submitLoading = true;
      this.form.quickReplies = JSON.stringify(this.tagList);
      editAutoChatSet(this.form).then((res) => {
        this.submitLoading = false;
        if (res.success) {
          this.$Message.success("操作成功");
          this.showDemo();
        }
      });
    },
  },
  mounted() {
    this.init();
  },
};
</script>
<style lang="less">
.chat {
  .setting-content {
    padding: 5px 0 0 10px;
    .setting-title {
      font-size: 20px;
      color: rgba(0, 0, 0, 0.85);
      font-weight: 500;
      margin-bottom: 25px;
    }
  }

  .iphone-content {
    display: flex;
    justify-content: center;
    padding: 10px 0;
    .demo-model {
      background-repeat: no-repeat;
      background-size: 100%;
      width: 360px;
      height: 730px;
      padding: 48px 13px 30px 13px;
      .model-content {
        box-sizing: border-box;
        width: 100%;
        height: 100%;
        .iframe {
          height: 100%;
          width: 100%;
          border-radius: 16px;
        }
      }
    }
  }
  .ivu-close-color {
    .ivu-icon-ios-close {
      color: #666 !important;
    }
  }
}
.preview-pc {
  position: absolute;
  z-index: 999;
  right: 40px;
  bottom: 50px;
  background-color: #fff;
  width: 150px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 22px;
  color: rgba(0, 0, 0, 0.87);
  cursor: pointer;
  -webkit-box-shadow: 0 12px 12px 0 rgba(9, 7, 7, 0.03),
    0 8px 4px 0 rgba(0, 0, 0, 0.04);
  box-shadow: 0 12px 12px 0 rgba(9, 7, 7, 0.03), 0 8px 4px 0 rgba(0, 0, 0, 0.04);
  &:hover {
    color: #2d8cf0;
    background: #fafafa;
  }
}
</style>