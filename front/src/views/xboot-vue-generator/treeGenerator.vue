<style lang="less">
@import "@/styles/tree&table-common.less";
.search {
  .preview {
    font-weight: 600;
    color: #40a9ff;
    cursor: pointer;
  }
}
</style>
<template>
  <div class="search">
    <Card>
      <Row class="operation" align="middle">
        <span>组件英文名：</span>
        <Tooltip
          content="生成的请求api文件中将使用该组件名拼接，建议驼峰法命名"
          placement="right"
          transfer
          max-width="250"
        >
          <Input
            v-model="vueName"
            clearable
            style="width: 150px; margin-right: 10px"
          />
        </Tooltip>
        <span>表单显示：</span>
        <Select
          v-model="rowNum"
          transfer
          style="width: 150px; margin-right: 10px"
        >
          <Option value="1">一行一列</Option>
          <Option value="2">一行两列</Option>
          <Option value="3">一行三列</Option>
          <Option value="4">一行四列</Option>
        </Select>
        <span>可切换树表格：</span>
        <i-switch v-model="enableTable" style="margin-right: 10px">
          <span slot="open">开</span>
          <span slot="close">关</span>
        </i-switch>
        <Button @click="add" type="primary" icon="md-add">添加字段</Button>
        <Button @click="entityModal = true" type="warning" icon="ios-construct"
          >读取字段</Button
        >
        <Button
          @click="generate"
          :loading="loading"
          type="success"
          icon="md-send"
          >生成代码</Button
        >
        <Button @click="clear" icon="md-trash">清空全部</Button>
      </Row>
      <Alert show-icon>
        将生成的代码复制粘贴至XBoot前端新建的空白组件中，再做少许修改并自行调通接口即可
        <span @click="preview" class="preview">树形结构预览</span>
        【字段 title、parentId、sortOrder、parentTitle 将自动生成，无需填入】
      </Alert>
      <Table border :columns="columns" :data="data" ref="table">
        <template slot-scope="{ row }" slot="field">
          <Input v-model="row.field" @on-blur="changeField(row, $event)" />
        </template>
        <template slot-scope="{ row }" slot="name">
          <Input v-model="row.name" @on-blur="changeName(row, $event)" />
        </template>
        <template slot-scope="{ row }" slot="editable">
          <i-switch
            v-model="row.editable"
            @on-change="changeEditable(row, $event)"
          >
            <span slot="open">开</span>
            <span slot="close">关</span>
          </i-switch>
        </template>
        <template slot-scope="{ row }" slot="type">
          <Select
            v-model="row.type"
            :disabled="!row.editable"
            @on-change="changeType(row, $event)"
            transfer
          >
            <Option value="text">文本输入框</Option>
            <Option value="textarea">多行文本输入框</Option>
            <Option value="select">选择下拉框</Option>
            <Option value="number">数字输入框</Option>
            <Option value="dict">数据字典选择组件</Option>
            <Option value="customList">自定义列表选择组件</Option>
            <Option value="date">日期选择器</Option>
            <Option value="datetime">日期时间选择器</Option>
            <Option value="daterange">日期范围选择器</Option>
            <Option value="upload">图片上传输入组件</Option>
            <Option value="uploadThumb">图片上传缩略图组件</Option>
            <Option value="fileUpload">文件上传/下载组件</Option>
            <Option value="switch">Switch开关</Option>
            <Option value="radio">Radio单选框</Option>
            <Option value="time">时间选择器</Option>
            <Option value="area">省市县级联</Option>
            <Option value="slider">Slider滑块</Option>
            <Option value="editor">富文本组件wangEditor</Option>
            <Option value="password">密码强度提示输入框</Option>
          </Select>
        </template>
        <template slot-scope="{ row }" slot="validate">
          <i-switch
            v-model="row.validate"
            @on-change="changeValidate(row, $event)"
            :disabled="!row.editable"
          >
            <span slot="open">是</span>
            <span slot="close">否</span>
          </i-switch>
        </template>
        <template slot-scope="{ row }" slot="action">
          <a @click="edit(row)">编辑</a>
          <Divider type="vertical" />
          <a @click="remove(row)">删除</a>
        </template>
      </Table>
    </Card>

    <Modal
      :title="modalTitle"
      v-model="modalVisible"
      :mask-closable="false"
      :width="500"
    >
      <Form ref="form" :model="form" :label-width="100" :rules="formValidate">
        <FormItem label="字段英文名" prop="field" class="block-tool">
          <Tooltip placement="right" content="与后端实体字段匹配">
            <Input v-model="form.field" />
          </Tooltip>
        </FormItem>
        <FormItem label="字段中文名" prop="name">
          <Input v-model="form.name" />
        </FormItem>
        <FormItem label="可添加编辑" prop="editable">
          <i-switch v-model="form.editable">
            <span slot="open">开</span>
            <span slot="close">关</span>
          </i-switch>
        </FormItem>
        <FormItem label="字段表单类型" prop="type" v-show="form.editable">
          <Select v-model="form.type" filterable transfer>
            <Option value="text">文本输入框</Option>
            <Option value="textarea">多行文本输入框</Option>
            <Option value="select">选择下拉框</Option>
            <Option value="number">数字输入框</Option>
            <Option value="dict">数据字典选择组件</Option>
            <Option value="customList">自定义列表选择组件</Option>
            <Option value="date">日期选择器</Option>
            <Option value="datetime">日期时间选择器</Option>
            <Option value="daterange">日期范围选择器</Option>
            <Option value="upload">图片上传输入组件</Option>
            <Option value="uploadThumb">图片上传缩略图组件</Option>
            <Option value="fileUpload">文件上传/下载组件</Option>
            <Option value="switch">Switch开关</Option>
            <Option value="radio">Radio单选框</Option>
            <Option value="time">时间选择器</Option>
            <Option value="area">省市县级联</Option>
            <Option value="slider">Slider滑块</Option>
            <Option value="editor">富文本组件wangEditor</Option>
            <Option value="password">密码强度提示输入框</Option>
          </Select>
        </FormItem>
        <FormItem label="字典类型" prop="dictType" v-show="form.type == 'dict'">
          <customList
            v-model="form.dictType"
            filterable
            url="/dict/getAll"
            valueBind="type"
            description="type"
          />
        </FormItem>
        <FormItem
          label="自定义URL"
          prop="customUrl"
          v-show="form.type == 'customList'"
        >
          <Input
            v-model="form.customUrl"
            placeholder="输入自定义选择组件url属性"
          />
        </FormItem>
        <FormItem label="显示级别" prop="level" v-show="form.type == 'area'">
          <Select transfer v-model="form.level">
            <Option value="0">仅显示省</Option>
            <Option value="1">显示省和县</Option>
            <Option value="2">显示省市县</Option>
          </Select>
        </FormItem>
        <FormItem label="是否必填" prop="validate" v-show="form.editable">
          <i-switch v-model="form.validate">
            <span slot="open">是</span>
            <span slot="close">否</span>
          </i-switch>
        </FormItem>
        <FormItem label="排序值" prop="sortOrder">
          <InputNumber v-model="form.sortOrder"></InputNumber>
        </FormItem>
      </Form>
      <div slot="footer">
        <Button type="text" @click="modalVisible = false">取消</Button>
        <Button type="primary" @click="handleSubmit">提交</Button>
      </div>
    </Modal>
    <Modal
      v-model="codeModal"
      :width="900"
      :fullscreen="full"
      :styles="full ? {} : modalStyle"
    >
      <div slot="header">
        <div class="ivu-modal-header-inner">生成代码</div>
        <a @click="full = !full" class="modal-fullscreen">
          <Icon
            v-show="!full"
            type="ios-expand"
            class="model-fullscreen-icon"
          />
          <Icon
            v-show="full"
            type="ios-contract"
            class="model-fullscreen-icon"
          />
        </a>
        <a @click="codeModal = false" class="ivu-modal-close">
          <Icon type="ios-close" class="ivu-icon-ios-close" />
        </a>
      </div>
      <RadioGroup
        v-model="resultType"
        style="margin-bottom: 15px"
        @on-change="changeRadio"
      >
        <Radio label="drawerApi" border>树结构+抽屉(API)</Radio>
        <Radio label="drawer" border>树结构+抽屉(模拟请求)</Radio>
        <Radio label="resultApi" border>树结构(API)</Radio>
        <Radio label="result" border>树结构(模拟请求)</Radio>
      </RadioGroup>
      <Tabs v-model="tabName" type="card" @on-click="changeCode">
        <TabPane name="index.vue" label="index.vue"></TabPane>
        <TabPane
          v-if="resultType == 'drawerApi' || resultType == 'resultApi'"
          name="api.js"
          label="api.js"
        ></TabPane>
      </Tabs>
      <Input
        v-if="!full"
        v-model="code"
        type="textarea"
        autosize
        style="max-height: 60vh; overflow: auto"
      />
      <Input v-if="full" v-model="code" :rows="32" type="textarea" />
      <div slot="footer">
        <Button
          v-clipboard:copy="code"
          v-clipboard:success="onCopy"
          v-clipboard:error="onError"
          type="success"
          icon="md-copy"
          >复制代码</Button
        >
        <Button type="primary" @click="download" icon="md-download"
          >下载代码</Button
        >
      </div>
    </Modal>
    <Modal v-model="entityModal" :width="700" :fullscreen="fullEntity">
      <div slot="header">
        <div class="ivu-modal-header-inner">自动读取字段</div>
        <a @click="fullEntity = !fullEntity" class="modal-fullscreen">
          <Icon
            v-show="!fullEntity"
            type="ios-expand"
            class="model-fullscreen-icon"
          />
          <Icon
            v-show="fullEntity"
            type="ios-contract"
            class="model-fullscreen-icon"
          />
        </a>
        <a @click="entityModal = false" class="ivu-modal-close">
          <Icon type="ios-close" class="ivu-icon-ios-close" />
        </a>
      </div>
      <Alert show-icon
        >输入实体类的引用路径，将自动读取其字段生成所需JSON配置数据，免去手动配置添加字段</Alert
      >
      <Form
        ref="entityForm"
        :model="entityForm"
        :label-width="130"
        :rules="entityFormValidate"
      >
        <FormItem label="实体类引用路径" prop="path">
          <Row type="flex" justify="space-between">
            <Input
              v-model="entityForm.path"
              placeholder="例如：cn.exrick.xboot.modules.base.entity.User"
              clearable
              style="width: 410px"
            />
            <Button type="warning" icon="md-play" @click="generateEntityData"
              >读取字段</Button
            >
          </Row>
        </FormItem>
      </Form>
      <Input
        v-if="!fullEntity"
        v-model="entityData"
        type="textarea"
        autosize
        style="max-height: 50vh; overflow: auto"
        placeholder="生成结果"
      />
      <Input
        v-if="fullEntity"
        v-model="entityData"
        :rows="32"
        type="textarea"
      />
      <div slot="footer">
        <Button
          type="primary"
          icon="md-checkmark-circle-outline"
          @click="submitEntityData"
          >确认提交</Button
        >
      </div>
    </Modal>
  </div>
</template>

<script>
import { generateTree, getEntityData } from "@/api/index";
import customList from "@/views/my-components/xboot/custom-list";
import FileSaver from "file-saver";
export default {
  name: "tree-generator",
  components: {
    customList,
  },
  data() {
    return {
      resultType: "drawerApi",
      tabName: "index.vue",
      modalStyle: {
        top: "30px",
      },
      result: {},
      entityModal: false,
      fullEntity: false,
      entityData: "",
      entityForm: {
        path: "",
      },
      loading: false,
      code: "",
      vueName: "",
      rowNum: "1",
      full: false,
      codeModal: false,
      modalVisible: false,
      modalType: 0,
      modalTitle: "",
      form: {
        sortOrder: 0,
        field: "",
        name: "",
        dictType: "",
        customList: "",
        level: "2",
        editable: true,
        type: "text",
        validate: true,
      },
      formValidate: {
        field: [{ required: true, message: "不能为空", trigger: "change" }],
        name: [{ required: true, message: "不能为空", trigger: "change" }],
      },
      entityFormValidate: {
        path: [{ required: true, message: "不能为空", trigger: "change" }],
      },
      columns: [
        // 表头
        {
          title: "排序",
          key: "sortOrder",
          sortType: "asc",
          sortable: true,
          align: "center",
          minWidth: 80,
        },
        {
          title: "字段英文名",
          slot: "field",
          minWidth: 150,
        },
        {
          title: "名称",
          slot: "name",
          minWidth: 150,
        },
        {
          title: "可添加编辑",
          slot: "editable",
          minWidth: 100,
        },
        {
          title: "表单类型",
          slot: "type",
          minWidth: 200,
        },
        {
          title: "是否必填",
          slot: "validate",
          minWidth: 110,
        },
        {
          title: "操作",
          slot: "action",
          align: "center",
          fixed: "right",
          minWidth: 120,
        },
      ],
      data: [],
      enableTable: true,
    };
  },
  methods: {
    init() {
      // 取缓存数据
      let data = this.getStore("treeData");
      let vueName = this.getStore("treeVueName");
      let rowNum = this.getStore("treeRowNum");
      let enableTable = this.getStore("enableTable");
      if (data && data != "undefined") {
        this.data = JSON.parse(data);
      }
      if (rowNum && rowNum != "undefined") {
        this.rowNum = rowNum;
      }
      if (vueName && vueName != "undefined") {
        this.vueName = vueName;
      }
      if (enableTable && enableTable != "undefined") {
        this.enableTable = eval(enableTable);
      }
    },
    generateEntityData() {
      this.$refs.entityForm.validate((valid) => {
        if (valid) {
          getEntityData({
            path: this.entityForm.path,
          }).then((res) => {
            if (res.success) {
              this.entityData = res.result;
            }
          });
        }
      });
    },
    submitEntityData() {
      if (!this.entityData) {
        this.$Message.warning("请先输入实体类引用路径生成JSON数据");
        return;
      }
      try {
        let data = JSON.parse(this.entityData);
        this.data = data.data;
        this.entityModal = false;
      } catch (e) {
        this.$Message.error("请确保JSON数据格式正确");
      }
    },
    preview() {
      this.$router.push({
        name: "tree",
      });
    },
    changeField(row, v) {
      for (let attr in row) {
        if (row[attr] == null) {
          row[attr] = "";
        }
      }
      let str = JSON.stringify(row);
      let data = JSON.parse(str);
      data.field = v.target.value;
      this.data.splice(row._index, 1, data);
      this.save();
    },
    changeName(row, v) {
      for (let attr in row) {
        if (row[attr] == null) {
          row[attr] = "";
        }
      }
      let str = JSON.stringify(row);
      let data = JSON.parse(str);
      data.name = v.target.value;
      this.data.splice(row._index, 1, data);
      this.save();
    },
    changeType(row, v) {
      for (let attr in row) {
        if (row[attr] == null) {
          row[attr] = "";
        }
      }
      let str = JSON.stringify(row);
      let data = JSON.parse(str);
      data.type = v;
      this.data.splice(row._index, 1, data);
      this.save();
    },
    changeEditable(row, v) {
      for (let attr in row) {
        if (row[attr] == null) {
          row[attr] = "";
        }
      }
      let str = JSON.stringify(row);
      let data = JSON.parse(str);
      data.editable = v;
      this.data.splice(row._index, 1, data);
      this.save();
    },
    changeValidate(row, v) {
      for (let attr in row) {
        if (row[attr] == null) {
          row[attr] = "";
        }
      }
      let str = JSON.stringify(row);
      let data = JSON.parse(str);
      data.validate = v;
      this.data.splice(row._index, 1, data);
      this.save();
    },
    handleSubmit() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          // 转换null为""
          let v = this.form;
          for (let attr in v) {
            if (v[attr] == null) {
              v[attr] = "";
            }
          }
          let str = JSON.stringify(v);
          let data = JSON.parse(str);
          if (this.modalType == 0) {
            this.data.push(data);
            this.data = this.data;
          } else {
            this.data.splice(v._index, 1, data);
          }
          this.save();
          this.modalVisible = false;
        }
      });
    },
    add() {
      this.modalType = 0;
      this.modalTitle = "添加字段";
      this.$refs.form.resetFields();
      this.form.sortOrder = this.data.length + 1;
      this.modalVisible = true;
    },
    edit(v) {
      this.modalType = 1;
      this.modalTitle = "编辑字段";
      // 转换null为""
      for (let attr in v) {
        if (v[attr] == null) {
          v[attr] = "";
        }
      }
      let str = JSON.stringify(v);
      let data = JSON.parse(str);
      this.form = data;
      this.modalVisible = true;
    },
    remove(v) {
      this.data.splice(v._index, 1);
      this.save();
      this.$Message.success("操作成功");
    },
    clear() {
      this.$Modal.confirm({
        title: "确认清空",
        content: "您确认要清空所有数据 ?",
        onOk: () => {
          this.data = [];
          this.vueName = "";
          this.rowNum = "1";
          this.enableTable = true;
          this.save();
          this.$Message.success("操作成功");
        },
      });
    },
    generate() {
      if (!this.vueName) {
        this.$Message.warning("请输入组件名");
        return;
      }
      this.loading = true;
      // 判断是否有重复字段
      let flag = false;
      this.data.forEach((e) => {
        if (
          e.field == "title" ||
          e.field == "parentId" ||
          e.field == "sortOrder" ||
          e.field == "parentTitle"
        ) {
          flag = true;
        }
      });
      if (flag) {
        this.loading = false;
        this.$Modal.confirm({
          title: "无效字段提示",
          content:
            "您添加的字段中包含以下无效的重复字段：title、parentId、sortOrder、parentTitle，确认后将自动过滤生成",
          onOk: () => {
            this.loading = true;
            this.data = this.data.filter((e) => {
              return (
                e.field != "title" &&
                e.field != "parentId" &&
                e.field != "sortOrder" &&
                e.field != "parentTitle"
              );
            });
            generateTree(
              this.vueName,
              this.rowNum,
              this.enableTable,
              this.data
            ).then((res) => {
              this.loading = false;
              if (res.success) {
                this.result = res.result;
                this.changeCode();
                this.codeModal = true;
                this.save();
              }
            });
          },
        });
      } else {
        generateTree(
          this.vueName,
          this.rowNum,
          this.enableTable,
          this.data
        ).then((res) => {
          this.loading = false;
          if (res.success) {
            this.result = res.result;
            this.changeCode();
            this.codeModal = true;
            this.save();
          }
        });
      }
    },
    changeRadio() {
      this.tabName = "index.vue";
      this.changeCode();
    },
    changeCode() {
      if (this.resultType == "drawerApi") {
        if (this.tabName == "index.vue") {
          this.code = this.result.drawerApi;
        }
        if (this.tabName == "api.js") {
          this.code = this.result.api;
        }
      }
      if (this.resultType == "drawer") {
        this.code = this.result.drawer;
      }
      if (this.resultType == "resultApi") {
        if (this.tabName == "index.vue") {
          this.code = this.result.resultApi;
        }
        if (this.tabName == "api.js") {
          this.code = this.result.api;
        }
      }
      if (this.resultType == "result") {
        this.code = this.result.result;
      }
    },
    onCopy() {
      this.$Message.success("复制成功");
    },
    onError() {
      this.$Message.warning("复制失败，请手动复制");
    },
    download() {
      var blob = new Blob([this.code], {
        type: "text/plain;charset=utf-8",
      });
      FileSaver.saveAs(blob, this.tabName);
    },
    save() {
      this.setStore("treeData", JSON.stringify(this.data));
      this.setStore("treeVueName", this.vueName);
      this.setStore("treeRowNum", this.rowNum);
      this.setStore("enableTable", this.enableTable);
    },
  },
  created() {
    this.init();
  },
};
</script>