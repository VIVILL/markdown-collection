

**搬瓦工CN2线路搭server记录**

不知道为什么自带的server无法使用了，我又用脚本重装了一遍。ps：公司电信网络，周一来到公司突然无法上网，然后我开热点共享wifi给电脑可以用。这不是长久之计，于是我又重装了一遍(不知道是否跟自带的ss有关)。然后这篇文章就被和谐掉啦（本来是发在简书上的，我一直拿简书当文档记录仓库来着的，现在看来还是不靠谱的）。之前就是怕被和谐，所以我没有详细写，现在来补全。
首先：

    官方免翻网站：https://bwh1.net/


商品链接（这个应该是所以商品都在这个链接下了）：https://bwh1.net/cart.php?

这个链接可以通过 Order New Services进入。
![](https://i.imgur.com/2Kz8d3D.png)




    我买的是CN2线路的vps，购买地址：https://bwh1.net/cart.php?a=confproduct&i=2


如果你对网速没有要求，官方目前最便宜的应该就是下图这款19.9美金一年的商品（注意买KVM的，不要买OVZ）。
![](https://i.imgur.com/ouIURSO.png)

 截图地址：https://bwh1.net/vps-hosting.php   
   

     19.9/yr KVM款购买地址：https://bwh1.net/cart.php?a=confproduct&i=1

购买的时候，支持支付宝支付。

总之，根据你的需求，在购买所需VPS host之后，在主机上安装款Shadowsocks server。


购买完之后，点击MyService。界面如下。
![](https://i.imgur.com/1XzInct.png)


点击kiwivm Control Panel

![](https://i.imgur.com/0DsygQg.png)


如图所示，我有2个vps host。一个自带Shadowsocks server（这个可以点击自带Shadowsocks server然后一键安装），一个不带。不过我不确定自带server的是否还可以正常使用。但是，无论如何，掌握自己搭建server都是必要的。
![](https://i.imgur.com/cyiSEJg.png)




首先，确保vps host未开始运行或者已kill/stop 。然后在kiwivm界面，点击Install new OS。这里我选择的是centos-6-86-bbr（据说这个更快），然后点击Reload。
![](https://i.imgur.com/4TfEdK8.png)

然后会给你一个密码以及端口号，记录下来这两个数据等会要用，当然这两个数据也会发送到你的注册邮箱，如果忘记也不要紧。

    new root password to access your VPS（密码）:
    xxxxx
    New SSH Port（端口）:
    xxxxx

然后，点击Main controls。几min后，当Main controls界面有数据出现时，表示主机已经处于运行状态，我们就可以通过XShell去连接vps，从而安装Shadowsocks server了。

![](https://i.imgur.com/llbYCN8.png)


CentOS 是一个基于Red Hat Linux 提供的可自由使用源代码的企业级Linux发行版本。因此，在CentOS系统中安装软件需要使用ssh工具。SSH工具则是用来远程连接Linux主机所使用。

Xshell是收费软件，但是有免费使用的方法，个人使用是不收费的，具体可参考下面链接。

https://blog.csdn.net/fwj_ntu/article/details/79728892

安装完Xshell之后，点击Xshell.exe后点击新建。

![](https://i.imgur.com/bU5Kgs3.png)

首先填写主机和端口号。


    所谓主机就是搬瓦工网页的kiwivm界面的Main contrals中的IP address，端口就是SSH Port。

![](https://i.imgur.com/Ny998tL.png)

![](https://i.imgur.com/0NSdKon.png)

接下来，点击连接的下级目录——用户身份验证。
![](https://i.imgur.com/Wn1sflZ.png)

填写用户名和密码。

    所谓用户名是root，密码就是Install new OS后给你的那个密码。


![](https://i.imgur.com/2VPduvq.png)

填写完这4个数据后，点击确定，然后就可以点击连接了。

![](https://i.imgur.com/fnEH8VG.png)

点击连接后，会弹出警告，点击接收并保存。

![](https://i.imgur.com/ED0tMh3.png)

此时就连接上了vps host了（如果连接失败，可以试多几次）。

![](https://i.imgur.com/NKre0wN.png)



首先，输入下面语句，安装wget。


     yum -y install wget


然后，一气呵成按照顺序，输入以下3条命令。

    wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
    chmod +x shadowsocks-all.sh
    ./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

这个安装速度取决于你的vps host的价格（越贵的性能越好，速度越快）。选择安装的版本

![](https://i.imgur.com/i6T7n9G.png)


我选择是go版本（输入3），因为对我而言go版本网速最快（我尝试过分别安装4种不同的版本然后打开youtube网站测速，四个版本的差别？）。

    期间由于在CentOS中修改了或安装了一些东西，导致使用一键安装脚本（四合一）时出现了libev相关的错误（这里后续有一些坑，四合一有多种版本的软件，部分版本功能不全，所以选择版本时要慎重）。
    
    解决办法：在搬瓦工的Main controls中kill掉vps，然后重新Install new OS。应该就相当于重新来过了。




然后就是选择密码跟端口号（注意，端口号我选择的是443，貌似现在除了443其他端口会被屏蔽）。密码跟端口就不截图了。

加密方式选择aes-256-cfb（输入1）。

![](https://i.imgur.com/lsW52aZ.png)


这里卡好久

![](https://i.imgur.com/vYluzcL.png)


剩下的就是等了。安装完后，会提示你Enjoy it!

参考链接：

使用搬瓦工bandwagonhost VPS安装完全指南 ： https://segmentfault.com/a/1190000010528542  （按这个做不成功）

VPS安装... ：https://www.diycode.cc/topics/738  （主要参考这个成功安装）

这几款免费SSH工具，你用哪个？https://www.xiaoz.me/archives/8157



登录参考链接：

http://www.right.com.cn/forum/forum.php?mod=viewthread&tid=255148&page=1

然后就可以开始在Xshell中输入命令了。安装命令来自这篇（https://www.diycode.cc/topics/738）。就是这3条命令，然后分别选择即可。




proxifier 注册码

http://www.cnblogs.com/c4isr/p/5933359.html


L6Z8A-XY2J4-BTZ3P-ZZ7DF-A2Q9C（Portable Edition）

5EZ8G-C3WL5-B56YG-SCXM9-6QZAP（Standard Edition）

P427L-9Y552-5433E-8DSR3-58Z68（MAC）



