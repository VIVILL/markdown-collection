由于不可抗力的因素，有时候购买的vps会出现你所在的网络无法访问vps的ip地址的问题。
这种时候就需要在x-sheel中添加代理，同时还要保证你此时可以访问你想要访问的网络，即你必须要有另一个可用工具能访问外网。
此时，除了在x-shell中填写ip地址、端口和密码外，还需要设置隧道和代理。
设置完成后如下所示。

![](https://i.imgur.com/1GfIWrq.png)

![](https://i.imgur.com/ZPPvGE6.png)

首先，在隧道中添加规则，类型选择Dynamic，端口默认1080。

![](https://i.imgur.com/8EWqqPR.png)

然后在代理中点击浏览，添加代理。

![](https://i.imgur.com/ZF1UcUo.png)

名称就随便写test，类型选SOCKS5，主机填127.0.0.1，端口填1080。

具体如下所示。

![](https://i.imgur.com/AuQTNZi.png)

然后代理服务器选中test。

![](https://i.imgur.com/SUCiTxR.png)

设置完隧道和代理服务器后，在确保你可以访问外网情况下就可以通过x-shell连接上不可用ip的vps了。

参考链接：

[Xshell通过跳板机连接远端主机](https://www.jianshu.com/p/d8119f1062b6)

[Xshell添加ssh隧道SOCKS代理](https://www.cnblogs.com/ExMan/p/10764023.html)