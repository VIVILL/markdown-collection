1.在搬瓦工购买好vps后,装OS。
首先点击stop关闭OS。


![](https://i.imgur.com/gnb6IWM.png)



然后安装所需OS ，选择带bbr的centos。


![](https://i.imgur.com/T77Zk1S.png)


然后就是出现了vps的密码和SSH Port。记住这2个数据，后面需要用到。还有一个需要用到的是Public IP address。这里总共3个数据后面需要用到。

![](https://i.imgur.com/RxJu3o7.png)


![](https://i.imgur.com/F4YGz5T.png)


2.使用Xshell+脚本装。
我这里使用的是Xshell5.
点击文件-新建。这里只要填3个数据，其他的保持别动。
主机(H)这里填上Public IP address（例如192.168.1.1这种），即你买的ip端口号(O)这里填SSH Port。

![](https://i.imgur.com/tL9rKze.png)


然后点到用户身份验证，在密码这里填入vps的密码，然后点击确定。

![](https://i.imgur.com/smjYREr.png)


填好后点击连接。确保连接成功后处于su状态（即#号），否则后续一些命令会有问题。

![](https://i.imgur.com/FKZsDun.png)


然后，这里要先使用下面的命令安装wget。

```
yum -y install wget
```

参考链接：
centos下wget: command not found的解决方法https://www.cnblogs.com/simonbaker/p/5131019.html





到这里就可以使用脚本文件安装了。这里是秋水逸冰做的脚本文件。
```
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log
```


我这里选了python版本。加密方式选了默认的aes-256-gcm。
![](https://i.imgur.com/Wtgespa.png)

![](https://i.imgur.com/b3Xt531.png)

任意按一个键后就可以开始等他安装了。

![](https://i.imgur.com/jXiJ9e6.png)

装完后会显示出你的ip地址、端口、密码以及加密方式，这个是给（pc或者移动端）客户端用的。

![](https://i.imgur.com/zvD06SO.png)


以pc端为例，去github下载。

[https://github.com/shadowsocks/shadowsocks-windows/releases](https://github.com/shadowsocks/shadowsocks-windows/releases)

下载releases下的最新版的zip文件，解压。点击小飞机图标，打开客户端，配置ip、端口、密码和加密方式等数据。

![](https://i.imgur.com/ud50n7v.png)


自定义所需数据，如下图所示（注意，服务器地址和端口以及密码都是我瞎写的，加密方式要设置成之前配置的），然后点击确定。然后小飞机图标就跑到右下角去了。

![](https://i.imgur.com/vJMNsor.png)

右键小飞机，设置系统代理为PAC模式，然后就可以用了。


![](https://i.imgur.com/W9tb66a.png)







参考链接：
轻松在 VPS 搭建 Shadowsocks 翻墙 ($5/月 支付宝)
[https://www.diycode.cc/topics/738](https://www.diycode.cc/topics/738)