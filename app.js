App({
  data: {
    loginID: '',
    loginCode: '',
    loginIdentify:'',
    loginTel:'',
    loginName: '',
    houseID:'',
    roomID:'',
    tenantID:'',
    departname:'',
    // 本地测试请选择第一个appUrl
    // appUrl:'http://localhost:8080/forestry',
    // 体验线上demo，请选择第二个appUrl
    appUrl: 'https://changjienongye.cn/forestry',
  },
  onLoad: function (options) {
    console.log("app页面获取的loginID = " + options.loginID);
  },
  onLaunch: function () {
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {
          wx.getUserInfo({
            success: res => {
              this.globalData.userInfo = res.userInfo
              if (this.userInfoReadyCallback) {
                this.userInfoReadyCallback(res)
              }
            }
          })
        }
      }
    })
  },
  globalData: {
    userInfo: null
  }
})