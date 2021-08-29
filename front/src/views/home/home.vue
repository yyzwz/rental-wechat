<template>
  <div :style="{ height: clientHeight }" class="topDiv">
    <Row :gutter="20">
      <div class="body">
        <div class="time">
          <p class="timep">{{ showtime }}</p>
          <span>{{ yeartime }}</span>
        </div>
        <div class="right">
          <div class="title">
            <h1 class="bt">私车公用系统</h1>
            <p class="titlep">SCGY OFFICE SYSTEM</p>
          </div>
          <div class="heng"></div>
          <div class="hello">
            <span class="hi">欢迎{{ name }}</span>
            <!-- <span class="didian">登入地址：{{ location }}</span> -->
          </div>
          <div class="box">
            <div class="button">
              <div class="left">
                <img
                  class="homeThreeIcon"
                  src="../../assets/icon/homeIcon1.png"
                />
                <span class="text">待办</span>
              </div>
              <div class="shu"></div>
              <div class="number">0</div>
            </div>
            <div class="button">
              <div class="left">
                <img
                  class="homeThreeIcon"
                  src="../../assets/icon/homeIcon2.png"
                />
                <span class="text">已办</span>
              </div>
              <div class="shu"></div>
              <div class="number">0</div>
            </div>
            <div class="button">
              <div class="left">
                <img
                  class="homeThreeIcon"
                  src="../../assets/icon/homeIcon3.png"
                />
                <span class="text">未办</span>
              </div>
              <div class="shu"></div>
              <div class="number">0</div>
            </div>
          </div>
        </div>
        <!-- <span class="title">艾是OA办公系统</span>
        <span class="manage2">
          欢迎<span style="color:(255, 255, 255, 1.0);fontSize:32px;marginLeft:10px;letter-spacing: 2px;">{{ name }}</span>
        </span>
        <div class="threeButton">
          <div class="button" style="background:#333;border:2px solid #DDBC8B;opacity: 0.5;">
            <img class="homeThreeIcon" src="../../assets/icon/homeIcon1.png"/>
            我的待办 | 0
          </div>
          <div class="button" style="background:#333;border:2px solid #5DDD88;opacity: 0.5;">
            <img class="homeThreeIcon" src="../../assets/icon/homeIcon2.png"/>
            我的已办 | 0
          </div>
          <div class="button" style="background:#333;border:2px solid #BB80BB;opacity: 0.5;">
            <img class="homeThreeIcon" src="../../assets/icon/homeIcon3.png"/>
            我的申请 | 0
          </div>
        </div>
        <div class="bottom">
          <span class="manage"
            >您在<span style="margin:0 15px">{{ location }}</span
            >登录</span
          >
          <span class="showtime">{{ showtime }}</span>
        </div> -->
      </div>
      <!-- <div class="text">
        <span class="manage2">
          欢迎<span style="color:#f00; marginLeft:10px">{{ name }}</span>
        </span>
        <div class="">
          <span class="manage">工号:{{ jonNumber }}</span>
          <span class="manage">{{ location }}</span>
          <span class="manage3">{{ showtime }}</span>
        </div>
      </div> -->
    </Row>
  </div>
</template>

<script>
import Cookies from "js-cookie";
import { ipInfo } from "@/api/index";
export default {
  name: "dashboard-2",
  data() {
    return {
      name: "",
      showtime: "",
      yeartime: "",
      ip: "",
      location: "公司内网",
      jonNumber: ""
    };
  },

  methods: {
    init() {
      let user = JSON.parse(Cookies.get("userInfo"));
      this.name = user.nickname;
      this.jonNumber = user.username;
      this.getNowTime();
      ipInfo().then((res) => {
        if (res.success) {
          this.location = res.result;
        }
      });
      this.timer = setInterval(this.getNowTime, 1000);
    },
    selectItem(e) {
      this.$router.push({
        name: e.name,
      });
    },
    getNowTime() {
      this.showtime = this.format(new Date(), "HH:mm:ss");
      this.yeartime = this.format(new Date(), "yyyy年MM月dd日 ");
    },
  },
  mounted() {
    this.init();
    this.clientHeight = `${document.documentElement.clientHeight}`; //获取浏览器可视区域高度
    let that = this;
    window.onresize = function() {
      this.clientHeight = `${document.documentElement.clientHeight}`;
      if (that.$refs.page) {
        that.$refs.page.style.minHeight = clientHeight - 100 + "px";
      }
    };
  },
  watch: {
    clientHeight() {
      this.changeFixed(this.clientHeight);
    },
  },
};
</script>

<style lang="less" scoped>
@import "./home.less";
.margin {
  margin-bottom: 20px;
}
.title {
  font-size: 72px;
  margin: 10vh 0;
  color: rgba(255, 255, 255);
  letter-spacing: 10px;
  font-family: KaiTi;
}
.manage {
  font-family: Microsoft YaHei;
  font-size: 16px;
  margin-bottom: 5px;
  color: rgb(255, 255, 255, 0.7);
}
.manage2 {
  font-size: 28px;
  font-weight: 550;
  color: rgb(255, 255, 255, 0.7);
  margin-bottom: 15px;
}
.threeButton {
  width: 70%;
  display: flex;
  justify-content: space-between;
  margin: 10vh 0;
}
.button {
  width: 28%;
  min-width: 160px;
  min-height: 80px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  border-radius: 22px;
  color: #fff;
}
.showtime {
  font-family: Microsoft YaHei;
  font-size: 16px;
  color: rgb(255, 255, 255);
}
.bottom {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 7vh;
}
.homeThreeIcon {
  opacity: 1;
  height: 25px;
  width: 25px;
  margin-right: 10%;
}
.time {
  margin: auto 0 100px 5%;
  .timep {
    color: rgba(255, 255, 255);
    font-size: 34px;
    letter-spacing: 3px;
  }
  span {
    color: #fff;
    font-size: 18px;
  }
}
.right {
  float: right;
  padding: 35px 0;
  display: flex;
  color: #fff;
  flex-direction: column;
  background-color: rgba(3, 3, 3, 0.4);
  margin: auto 5% auto 0;
  max-width: 500px;
  border: 1px solid rgb(255, 255, 255, 0.7);
}
.title {
  display: flex;
  flex-direction: column;
  margin: 0;
  .bt {
    font-size: 45px;
    font-weight: 550;
    display: flex;
    flex-wrap: nowrap;
    margin: 0 50px;
  }
  .titlep {
    font-size: 18px;
    font-weight: 100;
    letter-spacing: 0;
    margin: 0 50px;
    color: rgba(255, 255, 255, 0.8);
  }
}
.heng {
  border-top: 1px solid rgb(255, 255, 255, 0.3);
  margin: 30px 50px;
}
.hello {
  margin: 0 50px 30px;
  display: flex;
  justify-content: space-between;
  .hi {
    font-size: 24px;
  }
  .didian {
    font-size: 20px;
    color: rgba(255, 255, 255, 0.8);
  }
}
.box {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin: 0 50px;
}
.button {
  display: flex;
  justify-content: space-between;
  width: 100%;
  height: 45px;
  background-color: rgba(255, 255, 255, 0.3);
  border-radius: 10px;
  margin-bottom: 20px;
  padding: 0 50px;
  z-index: 99;
  .left {
    width: 40%;
    display: flex;
    flex-wrap: nowrap;
    align-items: center;
  }
  .text {
    font-size: 20px;
    position: relative;
  }
  .shu {
    width: 1px;
    height: 15px;
    background: #fff;
    margin-right: 20%;
  }
  .number {
    font-size: 22px;
    color: #fff;
  }
}
</style>
