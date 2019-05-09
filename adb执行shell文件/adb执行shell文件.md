注意：以下操作环境为win7 + android 5。
要想在android设备中执行sh文件，有2种方式。

一、一种是执行 adb  shell（注意 test.sh文件这里是放在跟adb工具一样的目录下）。
首先，使用Notepad++ 新建文件，后缀命名为sh。

新建test.sh文件

    echo  "Hello"

然后执行test.sh文件。

    adb shell < test.sh

二、另一种是将sh文件copy至android设备目录下（例如/sdcard/1/），然后执行。
新建test_android.sh 文件。

    #! /system/bin/sh
    
    echo  "Hello"

copy文件至android设备中（我是使用adb push 将数据copy进android设备中的），进入相关目录之后再执行文件。

    adb shell
    
    //进入android设备中
    
    cd /sdcard/1/   
    
    //进入sh文件所在目录
    
    sh ./test_android.sh
    
    //执行sh文件
    
如果没有权限，可以在进入sh对应的文件目录后 尝试执行chmod 777 test_android.sh   。
注意：第二种方式的sh文件要比第一种方式多加一句  #! /system/bin/sh。

两者执行结果一致。

现在需要在执行shell文件的时候传入参数，我尝试使用第一种方式传入参数没有成功，第二种成功了 。具体代码如下

    #! /system/bin/sh
    
    echo "$1"

这种带参数的shell文件，执行命令如下

    sh ./test_android.sh 1

    //1就是参数

这里输出1。$1表示的就是第一个参数。




参考链接：

Shell 传递参数

http://www.runoob.com/linux/linux-shell-passing-arguments.html

How to run BASH script in my Android?

https://stackoverflow.com/questions/8094562/how-to-run-bash-script-in-my-android