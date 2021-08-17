<template>
  <div>
    <Card>
      <div slot="title">
        <div class="edit-head">
          <a @click="close" class="back-title">
            <Icon type="ios-arrow-back" />返回
          </a>
          <div class="head-name">编辑</div>
          <span></span>
          <a @click="close" class="window-close">
            <Icon type="ios-close" size="31" class="ivu-icon-ios-close" />
          </a>
        </div>
      </div>
      <div style="width: 500px">
        <Form ref="form" :model="form" :rules="formValidate" :label-width="100" label-position="left">
              <FormItem label="申请人" prop="userName" >
                <Input v-model="form.userName" clearable/>
              </FormItem>
              <FormItem label="文件类型" prop="fileType" >
                <InputNumber v-model="form.fileType" style="width:100%"></InputNumber>
              </FormItem>
              <FormItem label="申请人部门" prop="departmentTitle" >
                <Input v-model="form.departmentTitle" clearable/>
              </FormItem>
              <FormItem label="申请人职位" prop="position" >
                <Input v-model="form.position" clearable/>
              </FormItem>
              <FormItem label="通过情况" prop="flag" >
                <Input v-model="form.flag" clearable/>
              </FormItem>
              <FormItem label="部门领导" prop="step1" >
                <Input v-model="form.step1" clearable/>
              </FormItem>
              <FormItem label="行政总监" prop="step2" >
                <Input v-model="form.step2" clearable/>
              </FormItem>
              <FormItem label="法务" prop="step3" >
                <Input v-model="form.step3" clearable/>
              </FormItem>
              <FormItem label="董事长" prop="step4" >
                <Input v-model="form.step4" clearable/>
              </FormItem>
              <FormItem label="申请事由" prop="reason" >
                <Input v-model="form.reason" clearable/>
              </FormItem>
          <FormItem class="br">
            <Button @click="handleSubmit" :loading="submitLoading" type="primary">提交并保存</Button>
            <Button @click="handleReset">重置</Button>
            <Button type="dashed" @click="close">关闭</Button>
          </FormItem>
        </Form>
      </div>
    </Card>
  </div>
</template>

<script>
// 根据你的实际请求api.js位置路径修改
import { editGetFileAudit } from "./api.js";
export default {
  name: "edit",
  components: {
  },
  props: {
    data: Object
  },
  data() {
    return {
      submitLoading: false, // 表单提交状态
      form: { // 添加或编辑表单对象初始化数据
      userName: "",
      fileType: 0,
      departmentTitle: "",
      position: "",
      flag: "",
      step1: "",
      step2: "",
      step3: "",
      step4: "",
      reason: "",
    },
    // 表单验证规则
    formValidate: {
    }
    };
  },
  methods: {
    init() {
      this.handleReset();
      this.form = this.data;
    },
    handleReset() {
      this.$refs.form.resetFields();
    },
    handleSubmit() {
      this.$refs.form.validate(valid => {
        if (valid) {
          this.submitLoading = true;
          editGetFileAudit(this.form).then(res => {
            this.submitLoading = false;
            if (res.success) {
              this.$Message.success("操作成功");
              this.submited();
            }
          });
        }
      });
    },
    close() {
      this.$emit("close", true);
    },
    submited() {
      this.$emit("submited", true);
    }
  },
  mounted() {
    this.init();
  }
};
</script>
<style lang="less">
// 建议引入通用样式 具体路径自行修改 可删除下面样式代码
// @import "@/styles/single-common.less";
.edit-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;

    .back-title {
        color: #515a6e;
        display: flex;
        align-items: center;
    }

    .head-name {
        display: inline-block;
        height: 20px;
        line-height: 20px;
        font-size: 16px;
        color: #17233d;
        font-weight: 500;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .window-close {
        z-index: 1;
        font-size: 12px;
        position: absolute;
        right: 0px;
        top: -5px;
        overflow: hidden;
        cursor: pointer;

        .ivu-icon-ios-close {
            color: #999;
            transition: color .2s ease;
        }
    }

    .window-close .ivu-icon-ios-close:hover {
        color: #444;
    }
}
</style>