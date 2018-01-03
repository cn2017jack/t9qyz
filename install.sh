export LC_ALL="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"
links="http://qyz.ceojy.org"
echo "正在启动脚本.........."
yum -y install httpd php php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc PHP unzip zip screen
echo "正在关闭防火墙....."
chkconfig --level 35 iptables off
/etc/init.d/iptables stop 
chkconfig --levels 235 httpd on
/etc/init.d/httpd restart
echo "正在安装JAVA"
cd /
wget $links/jdk-8u144-linux-x64.zip
unzip jdk-8u144-linux-x64.zip
rpm -ivh jdk-8u144-linux-x64.rpm
echo "正在安装服务端....."
wget $links/export.zip
unzip export.zip
echo "正在安装网站....."
cd /var/www/html
wget  https://raw.githubusercontent.com/cn2017jack/t9qyz/master/wz.zip
unzip wz.zip
echo "正在设置启动脚本....."
cd /root
wget  https://raw.githubusercontent.com/cn2017jack/t9qyz/master/qd.zip
unzip qd.zip
chmod -R 777 /root
echo "游戏服务端搭建完成！"
echo "前往export目录anany和gsd，把里面的xdb文件夹清空完成删档"
