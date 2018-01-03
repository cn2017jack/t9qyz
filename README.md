# t9qyz
## t9青云志一键搭建脚本
   基于t9nuoya的xige脚本修改，更换为下载速度比较好的外链地址

下载putty或者是xshell工具连接好centos系统的服务器ssh
然后使用下面命令，等待安装完成
```Bash
yum -y install wget
wget --no-check-certificate https://raw.githubusercontent.com/cn2017jack/t9qyz/master/install.sh -O ./install.sh
chmod 700 ./install.sh
./install.sh install
```

服务端安装完成后我们只需要就行几项配置即可
使用winscp这个工具连接SFTP（同连接ssh方法一样）
由于部分机房没有备案域名，80端口是无法开放的
所以我们要更换http服务的80端口
打开/etc/httpd/conf/httpd.conf
按下Ctrl+F查找
Listen 80
然后在Listen 80下面加上
Listen 81
点击保存
然后回到SSH输入下面指令重启httpd服务
/etc/init.d/httpd restart

特别注意修改xauany.config.my.xml文件与客户端修改的文件。如果是没有备案的域名，一定要加上端口:81
如：http://123.24.66.55:81
否则会导致失败（需要加端口的是带http的，切记不要搞混）

##服务端配置方法
第一个是修改export目录下auany的xauany.config.my.xml
第二个是修改/var/www/html/qyz下
android_server_test.txt    安卓区服列表文件
ios_server_test.txt  苹果区服文件
前往export目录anany和gsd，把里面的xdb文件夹清空完成删档

##启动服务端
首先ssh连接好云服务器
输入screen -S qyz   （由于ssh断开连接后，运行的服务端会关闭，所以我们创建一个qyz的窗口用于后台运行，这样我们就可以断开ssh连接而不会关闭服务端）
然后输入  ./qd.sh    （启动）
输入  ./stop.sh （关闭服务端）
