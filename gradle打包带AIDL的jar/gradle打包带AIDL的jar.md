关键代码
   
    task class_jar(type: Jar) {
    from "build/intermediates/classes/release/" //核心，将.class 文件编译成Jar包
    from 'src/main/aidl/'
    destinationDir = file('build/libs')
    exclude('/android')
    archiveName 'AAA.jar'
    }
    class_jar.dependsOn(build)





gradle全部代码如下：


    apply plugin: 'com.android.library'
    
    android {
    compileSdkVersion 25
    buildToolsVersion "26.0.2"
    
    defaultConfig {
    minSdkVersion 16
    targetSdkVersion 19
    }
    
    buildTypes {
    release {
    minifyEnabled false
    proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.txt'
        }
      }
    }
    
    dependencies {
    compile 'com.android.support:support-v4:25.3.1'
    }

    task class_jar(type: Jar) {
    from "build/intermediates/classes/release/" //核心，将.class 文件编译成Jar包
    from 'src/main/aidl/'
    destinationDir = file('build/libs')
    exclude('/android')
    archiveName 'AAA.jar'
    }
    class_jar.dependsOn(build)
    
    
下面来详细解释一下这个配置的含义。当在gradle文件中添加下面的代码并点击Sync Project with Gradle File之后，android studio中的gradle project中的命令中会生成一个class_jar。

    task class_jar(type: Jar) {
    from "build/intermediates/classes/release/" //核心，将.class 文件编译成Jar包
    from 'src/main/aidl/'
    destinationDir = file('build/libs')
    exclude('/android')
    archiveName 'AAA.jar'
    }
    class_jar.dependsOn(build)


![](https://i.imgur.com/BXIGubL.png)

点击class_jar,底部的Run会自动弹出，会开始在project视图下的app/build/libs目录下生成AAA.jar文件。

![](https://i.imgur.com/1boV483.png)

![](https://i.imgur.com/kWLsW6M.png)


    
    class_jar是Task名字。
    
    destinationDir用来定义jar存放位置。
    from 表示打包的文件目录
    exclude用来过滤掉build/intermediates/classes/release/android这个文件夹（这个文件夹打包进去的话使用jar包的时候会出错）。
    
    archiveName 对生成的jar包进行命名

    dependsOn  表示class_jar这个Task依赖于build。
    B.dependsOn A， 这意味着，只要我执行task B，task A都会先执行。

参考资料：

Gradle实践之自定义打包jar+Log开关自动关闭

http://unclechen.github.io/2015/10/25/Gradle%E5%AE%9E%E8%B7%B5%E4%B9%8B%E6%89%93%E5%8C%85jar+Log%E5%BC%80%E5%85%B3%E8%87%AA%E5%8A%A8%E5%85%B3%E9%97%AD/

Android Gradle 自定义Task 详解

http://www.cnblogs.com/zhaoyanjun/p/7988965.html

SDK封装AIDL访问Native Service

https://www.jianshu.com/p/f7a77b6bd817