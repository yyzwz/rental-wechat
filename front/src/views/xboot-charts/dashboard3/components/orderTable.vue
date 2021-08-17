<template>
  <div class="order-table">
    <Card :padding="20">
      <div class="title">最新订单详情</div>
      <Table :columns="columns" :data="data"></Table>
    </Card>
  </div>
</template>

<script>
export default {
  name: "order-table",
  components: {},
  props: {},
  data() {
    return {
      columns: [
        {
          type: "index",
          width: 60,
          align: "center",
        },
        {
          title: "订单ID",
          key: "id",
          minWidth: 150,
          sortable: true,
        },
        {
          title: "用户",
          key: "name",
          minWidth: 100,
          sortable: true,
        },
        {
          title: "订单总价",
          key: "total",
          minWidth: 100,
        },
        {
          title: "支付方式",
          key: "payType",
          sortable: true,
          minWidth: 150,
          align: "center",
          render: (h, params) => {
            let img = "";
            if (params.row.payType == 0) {
              img = require("@/assets/icon/alipay.png");
            } else if (params.row.payType == 1) {
              img = require("@/assets/icon/wechatpay.png");
            } else if (params.row.payType == 2) {
              img = require("@/assets/icon/applepay.png");
            } else if (params.row.payType == 3) {
              img = require("@/assets/icon/paypal.png");
            } else if (params.row.payType == 4) {
              img = require("@/assets/icon/yinlian.png");
            }
            return h("img", {
              attrs: {
                src: img,
              },
              style: {
                width: "40px",
                height: "40px",
                margin: "5px 0",
                "object-fit": "contain",
              },
            });
          },
        },
        {
          title: "状态",
          key: "status",
          align: "center",
          minWidth: 150,
          render: (h, params) => {
            let color = "",
              text = "";
            if (params.row.status == 0) {
              color = "default";
              text = "待支付";
            } else if (params.row.status == 1) {
              color = "blue";
              text = "已支付";
            } else if (params.row.status == 2) {
              color = "green";
              text = "已完成";
            } else if (params.row.status == 3) {
              color = "orange";
              text = "已发货";
            } else if (params.row.status == 4) {
              color = "red";
              text = "已取消";
            }
            return h("div", [
              h(
                "Tag",
                {
                  props: {
                    color: color,
                  },
                },
                text
              ),
            ]);
          },
          filters: [
            {
              label: "待支付",
              value: 0,
            },
            {
              label: "已支付",
              value: 1,
            },
            {
              label: "已完成",
              value: 2,
            },
            {
              label: "已发货",
              value: 3,
            },
            {
              label: "已取消",
              value: 4,
            },
          ],
          filterMultiple: false,
          filterMethod(value, row) {
            return row.status == value;
          },
        },
        {
          title: "创建时间",
          key: "createTime",
          sortable: true,
          sortType: "desc",
          width: 180,
        },
        {
          title: "操作",
          key: "action",
          width: 200,
          align: "center",
          render: (h, params) => {
            return h("div", [
              h(
                "a",
                {
                  on: {
                    click: () => {
                      this.$Message.info("点击了" + params.row.id);
                    },
                  },
                },
                "查看详情"
              ),
            ]);
          },
        },
      ],
      data: [
        {
          id: "1338061428384468992",
          name: "XBoot",
          total: "5998.00",
          payType: 0,
          status: 0,
          createTime: "2021-08-08 00:08:00",
        },
        {
          id: "2838061428384468992",
          name: "Exrick",
          total: "568.80",
          payType: 1,
          status: 1,
          createTime: "2021-08-08 00:08:00",
        },
        {
          id: "3338066255608942592",
          name: "Exrick",
          total: "168.00",
          payType: 2,
          status: 2,
          createTime: "2021-08-08 00:08:00",
        },
        {
          id: "1344692740297986048",
          name: "Exrick",
          total: "68.50",
          payType: 3,
          status: 3,
          createTime: "2021-08-08 00:08:00",
        },
        {
          id: "5344708212645040128",
          name: "Exrick",
          total: "1068.00",
          payType: 4,
          status: 4,
          createTime: "2021-08-08 00:08:00",
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
<style lang="less" scoped>
.order-table {
  .title {
    font-size: 16px;
    font-weight: 600;
    color: #495057;
    margin-bottom: 24px;
  }
}
</style>