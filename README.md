# 基于微信小程序的房屋租赁管理系统

## 介绍
基于微信小程序房屋租赁管理系统，对房东-房屋-房间-租客进行网格化管理，帮助政府部门统计分析所辖区域的出租房屋情况。

微信小程序可以视为一种新形态的应用。相比于已有的嵌入在浏览器中的HTML5网页应用，他具有更高的系统权限，能访问更多的收集软硬件信息，同时也拥有更加贴近于系统原生应用的交互合操作体验。相比于系统原生APP，他不占用手机的空间，无须安装和卸载，实现了“触手可及”、“用完即走”的思想。


小程序对应后端项目：


```
https://gitee.com/yyzwz/rental-housing
```

---

## 界面预览

这是用户进入系统的首页

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/1.png" width = "300" height = "500" alt="首页" style="align:center" />

</div>

点击底部的“马上登陆”按钮，进入信息提示页

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/2.png" width = "300" height = "800" alt="消息提示页" style="align:center" />

</div>
勾选“我已仔细阅读上述通知”后，点击“下一步”按钮，进入登陆页

用户可以选择手机号一键登录，但必须要求小程序非个人认证，需要后端接受code返回key值。关于获取手机号教程可参考我的博文：

```java
https://zwz99.blog.csdn.net/article/details/105214094
```

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/3.png" width = "300" height = "500" alt="登录页A" style="align:center" />

</div>

当然也保留了账号密码登录的普通登录方式，如下图所示：

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/4.png" width = "300" height = "500" alt="登录页B" style="align:center" />

</div>

如果用户没有账号，可以切换至注册分页，进行注册操作。

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/5.png" width = "300" height = "500" alt="登录页C" style="align:center" />

</div>

登录成功后，进入到系统的首页。登陆后底部显示名称，这时候可以进入分菜单了。

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/6.png" width = "300" height = "500" alt="登陆后首页" style="align:center" />

</div>

进入第一个模块:房屋登记，可以添加自己名下的房屋。
支持普通文本框、选择器、GPS定位、图片上传的方式提交房屋信息。

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/7.png" width = "300" height = "800" alt="添加房屋模块" style="align:center" />

</div>
进入第二个模块：我的房屋，可以看到自己名下的房屋列表，如下图所示

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/8.png" width = "300" height = "500" alt="我的房屋模块" style="align:center" />

</div>

若房屋审核通过，可以点击房屋所在行，进入房屋下设房间列表模块，如下图所示

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/9.png" width = "300" height = "500" alt="我的房间模块" style="align:center" />

</div>

用户可以点击“获取房屋二维码”，触发wx:if条件显示房屋二维码，房屋照片同理；同时支持更新房屋的GPS定位，以及支持添加房屋下的房间信息。

进入第三个模块：租客登记
首先选择自己名下的房屋

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/10.png" width = "300" height = "500" alt="租客登记A" style="align:center" />

</div>

其次选择房屋下的房间，最后添加租客信息，如下图所示

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/11.png" width = "300" height = "1000" alt="租客登记B" style="align:center" />

</div>

第四个模块：和第三个模块相似，在依次选择房屋、房间后，可以查询租客的信息。

在微信开发者工具中，导入时需要选择自己的APPID，若无请点击“测试号”，个人认证无法使用获取手机号功能。

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/12.png" width = "800" height = "400" alt="开发" style="align:center" />

</div>

---

## 增值服务

- 作者会对本仓库进行不定期更新，安装教程在最下面，若有问题可通过Issue留言。

- 代码全部开源，系统安装配置运行,或是系统业务逻辑方面的问题，提供免费答疑。

- 可有偿提供开题、文献等各类文档、一对一远程语音教学，支持在此基础上继续定制开发。

- 可根据您的需求，有偿定制任何管理系统，毕设难度一般不超过400R，中大型项目可对公签合同，如有需求欢迎联系Q 916077357

---

## 安装
下载“微信开发者工具”，导入选择项目所在地址。
导入时请替换自己的小程序APPID，如何下图所示：

<div align=center>

<img src="https://artskyhome.com:17476/static/gitee/rental-wechat/13.png" width = "800" height = "400" alt="开发" style="align:center" />

</div>

---

## 说明

1. 本项目开源，遵循GPL-3.0开源协议，二次开发请注明原项目的来源，不允许直接转售。
2. 作者拥有本软件构建后的应用系统全部内容所有权及独立的知识产权。
3. 如有问题，欢迎在仓库Issue留言，看到后会第一时间回复。相关意见会酌情考虑，但没有一定被采纳的承诺或保证。
4. Github同步地址 https://github.com/yyzwz/rental-wechat,但会以GitEE更新为主。

## 免责声明

下载本系统代码的用户，必须同意以下内容，否则请勿下载！

1. 出于自愿而使用/开发本软件，了解使用本软件的风险，且同意自己承担使用本软件的风险。
2. 利用本软件构建的网站的任何信息内容以及导致的任何版权纠纷和法律争议及后果和作者无关，作者对此不承担任何责任。
3. 在任何情况下，对于因使用或无法使用本软件而导致的任何难以合理预估的损失（包括但不仅限于商业利润损失、业务中断与业务信息丢失），作者概不承担任何责任。
4. 必须了解使用本软件的风险，作者不承诺提供一对一的技术支持、使用担保，也不承担任何因本软件而产生的难以预料的问题的相关责任。