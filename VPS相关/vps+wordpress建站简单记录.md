
1.首先购买vps。
随便哪家。
然后装上cenos7以上系统。
2.购买域名。
我这里是买的腾讯的1块钱一年的域名。
买完并审核通过后 ，添加域名解析，即把域名指向网站空间IP。

![](https://i.imgur.com/LFrSvTc.png)


3.安装宝塔面板。
我这里装的的是linux版本的。

链接：
https://www.bt.cn/

在Xshell中输入以下命令，安装宝塔面板。


    yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh
    

然后等待，等它装完。安装好后会有如下信息。


![](https://i.imgur.com/sc58SEk.png)



    Bt-Panel: http://xx.xx.xx.xx:xx/xxxx
    username: xxxx
    password: xxxx
    

保存好这个信息，后续需要通过这个链接去访问宝塔面板。
打开链接输入账号密码。

![](https://i.imgur.com/G4UqcmL.png)


进入后，自动弹出推荐安装套件。

![](https://i.imgur.com/3dyUPXo.png)

选择安装LNMP。

![](https://i.imgur.com/DY3KHak.png)

![](https://i.imgur.com/dciEwQ8.png)

参考链接：

VPS 新手建站必备——宝塔面板一键安装教程
https://zhuanlan.zhihu.com/p/52812212

宝塔Linux面板安装教程 - 4月28日更新 - 6.9.2正式版
https://www.bt.cn/bbs/thread-19376-1-1.html

4.在宝塔面板中配置网站域名等。

如果不配置，访问网站的话会显示如下信息。

    没有找到站点
    您的请求在Web服务器中没有找到对应的站点！
    
    可能原因：
    
    您没有将此域名或IP绑定到对应站点!
    配置文件未生效!
    如何解决：
    
    检查是否已经绑定到对应站点，若确认已绑定，请尝试重载Web服务；
    检查端口是否正确；
    若您使用了CDN产品，请尝试清除CDN缓存；
    普通网站访客，请联系网站管理员；



![](https://i.imgur.com/a2szHgd.png)

在宝塔面板界面中点击网站->添加站点，填写域名等信息。

![](https://i.imgur.com/tfGTRUQ.png)


![](https://i.imgur.com/oj9CPcs.png)


例如我随便买的域名xxx.xyz ，域名那里填上 xxx.xyz 和www.xxx.xyz,数据库选择MySQL，然后记住这个数据库的用户名和密码，后续会用到。
此时再访问我购买的域名，就可以正常访问了。下一步就是使用wordpress了。
例如我的网址是 http://www.xxtest.xyz/ ，访问结果如下图。


![](https://i.imgur.com/jkvNGss.png)

参考链接：

搬瓦工VPS利用宝塔面板搭建网站(简单快捷)
http://www.qiweiseo.com/vps-baota-wangzhan.html

5.通过宝塔面板上传wordpress。

去wordpress官网下网安装包。

官网下载地址：
https://wordpress.org/download/


![](https://i.imgur.com/3nGp1aj.png)


点击下载。

![](https://i.imgur.com/HbnN64j.png)


通过宝塔面板界面中的文件可将安装包上传至vps中。

![](https://i.imgur.com/KAoU3fs.png)

找到网站的目录，例如我的是/www/wwwroot/xxtest.xyz，点击上传zip文件。
![](https://i.imgur.com/ovPDihu.png)


![](https://i.imgur.com/LQfFEwD.png)

![](https://i.imgur.com/kI31FQW.png)

点击解压。

![](https://i.imgur.com/fS2kK0X.png)

解压完成后，就可以访问wordpress。

www.xxtest.xyz/wordpress

此时遇到一个问题
Your server is running PHP version 5.4.45 but WordPress 5.2 requires at least 5.6.20.
我尝试升级PHP，但是还是不行（于此同时我还重启了面板和服务器然后就不能访问面板了，于是又使用命令用xshell重新生成了链接以及账号密码），中间可能还有地方需要更改，于是我决定使用低版本的wordpress去建站了。
在这里下载低版本的例如
https://wordpress.org/download/releases/

![](https://i.imgur.com/Kdud6cA.png)


删去服务器之前存在的wordpress相关文件，上传新的wordpress并解压。


现在所需要访问的链接是
http://www.xxtest.xyz/wordpress/

进入该链接后，自动跳转至初始化相关部分。


![](https://i.imgur.com/Eq7ykw2.png)

选择简体中文。

![](https://i.imgur.com/B31GcEO.png)


配置之前在宝塔面板中设置的数据库用户名和密码。

![](https://i.imgur.com/eIXnD7d.png)


![](https://i.imgur.com/qmdI4wi.png)

![](https://i.imgur.com/E9pqjTo.png)

密码要记住，其他随便填吧。

![](https://i.imgur.com/ASMBZXQ.png)

装好后，就可以访问 http://www.xxtest.xyz/wordpress/

wordpress会自动生成一篇hello world 文章。

![](https://i.imgur.com/UEGjkks.png)

6.开启https。

点击网站->设置中的SSL，直接申请Let's Encrypt。

![](https://i.imgur.com/vLPmlKB.png)

![](https://i.imgur.com/UfHncxS.png)

打开证书界面右上方的强制https开关。

访问网站http://www.xxtest.xyz/ 

就会自动跳转https://www.xxtest.xyz/


![](https://i.imgur.com/Fv7JMYs.png)

偶尔会遇到未知原因导致无法访问网页，都是重启或者重新安装宝塔解决。


参考链接：

宝塔面板开启ssl 

https://www.feiniaomy.com/post/159.html

教程：Vultr VPS上部署SSL启用HTTPS全攻略
https://vultrzc.wordpress.com/2017/11/11/jiao_cheng_vultr_vps_shang_bu_shu_ssl_qi_yong_https_quan_gong_lue/

利用VPS+LNMP1.5+WordPress搭建个人网站
https://www.zhouyongyi.com/vps-lnmp-wordpress-build-site/

VPS+LNMP+WordPress搭建个人网站/博客

http://jwcyber.com/build-site/

Centos 6/7 升级 PHP 5.6 到 7.1/7.2
https://www.centos.bz/2018/05/centos-6-7-%E5%8D%87%E7%BA%A7-php-5-6-%E5%88%B0-7-1-7-2/

WordPress建站教程 从零开始服务器搭建网站超详细
https://themeforwp.net/archives/wordpress-website-tutorial/

