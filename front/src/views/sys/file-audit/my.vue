<template>
  <div class="search">
    <add v-if="currView=='add'" @close="currView='index'" @submited="submited" />
    <edit v-if="currView=='edit'" @close="currView='index'" @submited="submited" :data="formData" />
    <Card v-show="currView=='index'">
      <Row class="operation">
        <Button @click="add" type="primary" icon="md-add">添加</Button>
        <Button @click="delAll" icon="md-trash">批量删除</Button>
        <Button @click="getDataList" icon="md-refresh">刷新</Button>
        <Button type="dashed" @click="openTip=!openTip">{{openTip ? "关闭提示" : "开启提示"}}</Button>
      </Row>
      <Alert show-icon v-show="openTip">
        已选择
        <span class="select-count">{{selectList.length}}</span> 项
        <a class="select-clear" @click="clearSelectAll">清空</a>
      </Alert>
      <Table
        :loading="loading"
        border
        :columns="columns"
        :data="data"
        ref="table"
        sortable="custom"
        @on-sort-change="changeSort"
        @on-selection-change="changeSelect"
      ></Table>
      <Row type="flex" justify="end" class="page">
        <Page
          :current="searchForm.pageNumber"
          :total="total"
          :page-size="searchForm.pageSize"
          @on-change="changePage"
          @on-page-size-change="changePageSize"
          :page-size-opts="[10,20,50]"
          size="small"
          show-total
          show-elevator
          show-sizer
        ></Page>
      </Row>
    </Card>
  </div>
</template>

<script>
// 根据你的实际请求api.js位置路径修改
import { getMyGetFileAuditList, deleteGetFileAudit,passOrDis } from "./api.js";
// 根据你的实际添加编辑组件位置路径修改
import add from "./add.vue";
import edit from "./edit.vue";
import { shortcuts } from "@/libs/shortcuts";
export default {
  name: "getFileAudit",
  components: {
    add,
    edit,
  },
  data() {
    return {
      openTip: true, // 显示提示
      formData: {},
      currView: "index",
      loading: true, // 表单加载状态
      searchForm: { // 搜索框初始化对象
        pageNumber: 1, // 当前页数
        pageSize: 10, // 页面大小
        sort: "createTime", // 默认排序字段
        order: "desc", // 默认排序方式
      },
      selectList: [], // 多选数据
      columns: [
      // 表头
      {
        type: "selection",
        width: 60,
        align: "center"
      },
      {
        type: "index",
        width: 60,
        align: "center"
      },
      {
        title: "申请人",
        key: "userName",
        minWidth: 120,
        sortable: false,
      },
      {
        title: "文件类型",
        key: "fileType",
        minWidth: 120,
        sortable: false,
        render: (h, params) => {
          if (params.row.fileType == 0) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#3CB371",
                  },
                },
                "普通文件"
              ),
            ]);
          } else {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "重要文件"
              ),
            ]);
          }
        },
      },
      {
        title: "申请人部门",
        key: "departmentTitle",
        minWidth: 120,
        sortable: false,
      },
      {
        title: "申请人职位",
        key: "position",
        minWidth: 120,
        sortable: false,
      },
      {
        title: "申请状态",
        key: "flag",
        minWidth: 120,
        sortable: false,
        render: (h, params) => {
          if (params.row.flag == 0) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#3CB371",
                  },
                },
                "尚未结束"
              ),
            ]);
          } else if (params.row.flag == 1) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "审批通过"
              ),
            ]);
          } else {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "审批退回"
              ),
            ]);
          }
        }
      },
      {
        title: "部门领导",
        key: "step1",
        minWidth: 120,
        sortable: false,
        render: (h, params) => {
          if (params.row.step1 == 1) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#3CB371",
                  },
                },
                "已审批"
              ),
            ]);
          } else if (params.row.step1 == 2) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "已拒绝"
              ),
            ]);
          } else {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "未审批"
              ),
            ]);
          }
        },
      },
      {
        title: "行政总监",
        key: "step2",
        minWidth: 120,
        sortable: false,
        render: (h, params) => {
          if (params.row.fileType == 0) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#3CB371",
                  },
                },
                "无需审批"
              ),
            ]);
          } else if (params.row.step1 == 2) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "已拒绝"
              ),
            ]);
          } else if (params.row.step2 == 1) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#3CB371",
                  },
                },
                "已审批"
              ),
            ]);
          } else {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "未审批"
              ),
            ]);
          }
        },
      },
      {
        title: "法务",
        key: "step3",
        minWidth: 120,
        sortable: false,
        render: (h, params) => {
          if (params.row.fileType == 0) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#3CB371",
                  },
                },
                "无需审批"
              ),
            ]);
          } else if (params.row.step3 == 1) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#3CB371",
                  },
                },
                "已审批"
              ),
            ]);
          } else if (params.row.step1 == 2) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "已拒绝"
              ),
            ]);
          } else {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "未审批"
              ),
            ]);
          }
        },
      },
      {
        title: "董事长",
        key: "step4",
        minWidth: 120,
        sortable: false,
        render: (h, params) => {
          if (params.row.fileType == 0) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#3CB371",
                  },
                },
                "无需审批"
              ),
            ]);
          } else if (params.row.step4 == 1) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#3CB371",
                  },
                },
                "已审批"
              ),
            ]);
          } else if (params.row.step1 == 2) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "已拒绝"
              ),
            ]);
          } else {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "未审批"
              ),
            ]);
          }
        },
      },
      {
        title: "申请事由",
        key: "reason",
        minWidth: 120,
        sortable: false,
      },
      {
        title: "操作",
        key: "action",
        align: "center",
        width: 150,
        render: (h, params) => {
          return h("div", [
            h(
                "Button",
                {
                  props: {
                    type: "primary",
                    size: "small",
                    disabled: (params.row.flag != 1)
                  },
                  style: {
                    marginRight: "5px",
                  },
                  on: {
                    click: () => {
                      this.downning(params.row);
                    },
                  },
                },
                "下载"
              ),
          ]);
        }
      }
    ],
      data: [], // 表单数据
      pageNumber: 1, // 当前页数
      pageSize: 10, // 页面大小
      total: 0 // 表单数据总数
    };
  },
  methods: {
    init() {
      this.getDataList();
    },
    submited() {
      this.currView = "index";
      this.getDataList();
    },
    changePage(v) {
      this.searchForm.pageNumber = v;
      this.getDataList();
      this.clearSelectAll();
    },
    changePageSize(v) {
      this.searchForm.pageSize = v;
      this.getDataList();
    },
    handleReset() {
      this.$refs.searchForm.resetFields();
      this.searchForm.pageNumber = 1;
      this.searchForm.pageSize = 10;
      // 重新加载数据
      this.getDataList();
    },
    changeSort(e) {
      this.searchForm.sort = e.key;
      this.searchForm.order = e.order;
      if (e.order === "normal") {
        this.searchForm.order = "";
      }
      this.getDataList();
    },
    clearSelectAll() {
      this.$refs.table.selectAll(false);
    },
    changeSelect(e) {
      this.selectList = e;
    },
    getDataList() {
      this.loading = true;
      getMyGetFileAuditList(this.searchForm).then(res => {
        console.log(res);
        this.loading = false;
        if (res.success) {
          this.data = res.result.records;
          this.total = res.result.total;
        }
      });
    },
    downning(e) {
      window.open(
        e.fileUrl +
          "?attname=&response-content-type=application/octet-stream&filename=" +
          e.fileName
      );
    },
    pass(e) {
      var that = this;
      this.$Modal.confirm({
        title: "确认审批通过",
        content: "确认审批通过?",
        loading: true,
        onOk: () => {
          passOrDis({id: e.id,ans: 1}).then(res => {
            this.$Modal.remove();
            if(res.success) {
              that.getDataList();
              this.$Message.success("审批通过成功");
            }
          })
        }
      });
    },
    disPass(e) {
      var that = this;
      this.$Modal.confirm({
        title: "确认审批退回",
        content: "确认审批退回?",
        loading: true,
        onOk: () => {
          passOrDis({id: e.id,ans: 2}).then(res => {
            this.$Modal.remove();
            if(res.success) {
              that.getDataList();
              this.$Message.success("审批退回成功");
            }
          })
        }
      });
    },
    add() {
      this.currView = "add";
    },
    edit(v) {
      // 转换null为""
      for (let attr in v) {
        if (v[attr] == null) {
          v[attr] = "";
        }
      }
      let str = JSON.stringify(v);
      let data = JSON.parse(str);
      this.formData = data;
      this.currView = "edit";
    },
    remove(v) {
      this.$Modal.confirm({
        title: "确认删除",
        // 记得确认修改此处
        content: "您确认要删除该条数据?",
        loading: true,
        onOk: () => {
          // 删除
            deleteGetFileAudit({ids: v.id}).then(res => {
              this.$Modal.remove();
              if (res.success) {
                this.$Message.success("操作成功");
                this.clearSelectAll();
                this.getDataList();
              }
            });
        }
      });
    },
    delAll() {
      if (this.selectList.length <= 0) {
        this.$Message.warning("您还未选择要删除的数据");
        return;
      }
      this.$Modal.confirm({
        title: "确认删除",
        content: "您确认要删除所选的 " + this.selectList.length + " 条数据?",
        loading: true,
        onOk: () => {
          let ids = "";
          this.selectList.forEach(function(e) {
            ids += e.id + ",";
          });
          ids = ids.substring(0, ids.length - 1);
          // 批量删除
            deleteGetFileAudit({ids: ids}).then(res => {
              this.$Modal.remove();
              if (res.success) {
                this.$Message.success("操作成功");
                this.clearSelectAll();
                this.getDataList();
              }
            });
        }
      });
    }
  },
  mounted() {
    this.init();
  }
};
</script>
<style lang="less">
// 建议引入通用样式 具体路径自行修改 可删除下面样式代码
// @import "@/styles/table-common.less";
.search {
    .operation {
        margin-bottom: 2vh;
    }
    .select-count {
        font-weight: 600;
        color: #40a9ff;
    }
    .select-clear {
        margin-left: 10px;
    }
    .page {
        margin-top: 2vh;
    }
    .drop-down {
        margin-left: 5px;
    }
}
</style>