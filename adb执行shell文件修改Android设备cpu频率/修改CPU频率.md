    #! /system/bin/sh
    
    cd /sys/devices/system/cpu/cpu0/cpufreq
    echo userspace > scaling_governor
    cat scaling_governor
    echo "$1" > scaling_max_freq
    cat scaling_cur_freq
    cd /sys/devices/system/cpu/cpu1/cpufreq
    echo userspace > scaling_governor
    cat scaling_governor 
    echo "$1" > scaling_max_freq
    cat scaling_cur_freq
    cd /sys/devices/system/cpu/cpu2/cpufreq
    echo userspace > scaling_governor
    cat scaling_governor 
    echo "$1" > scaling_max_freq
    cat scaling_cur_freq
    cd /sys/devices/system/cpu/cpu3/cpufreq
    echo userspace > scaling_governor
    cat scaling_governor
    echo "$1" > scaling_max_freq
    cat scaling_cur_freq
    


以上代码为设置cpu频率的sh（以上是带参数的sh）文件代码。文件命名为`cpu_fre_param.sh`。


使用方法：将sh文件从电脑目录下使用adb push到android设备中，进入android设备中的sh文件目录，然后sh执行sh文件（带参数）。具体命令如下：
 
     adb push cpu_fre_param.sh /sdcard/1/
     cd /sdcard/1/
     sh ./cpu_fre_param.sh 126000 
    

如果是不带参数的文件，（在电脑环境目录下，注意这里的sh文件是放在跟adb运行环境同一路径下）执行：

    adb shell < cpu_fre.sh


设置cpu频率参考链接：
http://blog.csdn.net/kris_fei/article/details/78016996

其他参考连接：
Shell 传递参数

http://www.runoob.com/linux/linux-shell-passing-arguments.html

How to run BASH script in my Android?
https://stackoverflow.com/questions/8094562/how-to-run-bash-script-in-my-android