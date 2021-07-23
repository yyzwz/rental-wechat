<template>
  <div class="search">
    <Card>
      <Row class="operation">
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
import { getAuditList, deleteAudit } from "./api.js";
import { shortcuts } from "@/libs/shortcuts";
export default {
  name: "audit",
  components: {
  },
  data() {
    return {
      openTip: true, // 显示提示
      formData: {},
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
        title: "车辆",
        key: "car",
        minWidth: 120,
        sortable: false,
      },
      {
        title: "车主",
        key: "carOwner",
        minWidth: 120,
        sortable: false,
      },
      {
        title: "驾车人",
        key: "jcr",
        minWidth: 120,
        sortable: false,
      },
      {
        title: "申请人",
        key: "sqr",
        minWidth: 120,
        sortable: false,
      },
      {
        title: "审核人",
        key: "shrr",
        minWidth: 120,
        sortable: false,
      },
      {
        title: "申请人部门",
        key: "ycbm",
        minWidth: 120,
        sortable: false,
      },
      {
        title: "开始时间",
        key: "kssj",
        minWidth: 150,
        sortable: false,
      },
      {
        title: "结束时间",
        key: "jssj",
        minWidth: 150,
        sortable: false,
      },
      {
        title: "出车地点",
        key: "ccdd",
        minWidth: 200,
        sortable: false,
      },
      {
        title: "目的地",
        key: "mdd",
        minWidth: 200,
        sortable: false,
      },
      {
        title: "事由",
        key: "reason",
        minWidth: 150,
        sortable: false,
      },
      {
        title: "图片",
        key: "image",
        minWidth: 120,
        sortable: false,
        render: (h, params) => {
          return h('img', {
            style: {
                width: '100px',
                'height': '80px',
                'border-radius': '5%'
            },
            attrs: {//设置属性
                src: "https://zwz99.top/car/" + params.row.image
            },
            on: {
              click: () => {
                this.lookBigImage(params.row);
              }
            }
          });
        }
      },
      {
        title: "状态",
        key: "status",
        minWidth: 120,
        sortable: false,
        tooltip: true,
        render: (h, params) => {
          if (params.row.status == 0) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#3CB371",
                  },
                },
                "未审核"
              ),
            ]);
          } else if (params.row.status == 1) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#00FF00",
                  },
                },
                "审核通过"
              ),
            ]);
          } else if (params.row.status == 2) {
            return h("div", [
              h(
                "span",
                {
                  style: {
                    color: "#ff0000",
                  },
                },
                "审核退回"
              ),
            ]);
          }
        },
      },
      {
        title: "操作",
        key: "action",
        align: "center",
        width: 150,
        render: (h, params) => {
          return h("div", [
            h(
              "a",
              {
                on: {
                  click: () => {
                    this.remove(params.row);
                  }
                }
              },
              "删除"
            )
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
    lookBigImage(e) {
      window.open("https://zwz99.top/car/" + e.image);
    },
    submited() {
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
      getAuditList(this.searchForm).then(res => {
        this.loading = false;
        if (res.success) {
          this.data = res.result.records;
          this.total = res.result.total;
        }
      });
    },
    remove(v) {
      this.$Modal.confirm({
        title: "确认删除",
        // 记得确认修改此处
        content: "您确认要删除该条数据?",
        loading: true,
        onOk: () => {
          // 删除
            deleteAudit({ids: v.id}).then(res => {
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
            deleteAudit({ids: ids}).then(res => {
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