#!/bin/bash

vpn_username=`tail -1 /etc/openvpn/psw-file | awk '{print $1}'`
#echo $vpn_username
vpn_password=`tail -1 /etc/openvpn/psw-file | awk '{print $2}'`
#echo $vpn_password
datetime=`date +%Y-%m-%d`

echo "### ----- Copy to 企业微信通知用户 ----- ###
# Update on $datetime"

echo "1、openVPN:"
echo "将配置文件解压到C:\Program Files\OpenVPN\config目录下,以管理员权限，启动客户端后右键连接openvpn-int-hxcloud。
用户名: $vpn_username
密码: $vpn_password"

echo "2、ETX:
浏览器访问 https://hxcloud.tsingmicro.xyz:8443/etx/ ,右上角齿轮,Client SETTINGS,Download launcher,安装完成后,刷新浏览器登录。
用户名: $vpn_username
默认密码: 123.com
"

echo "3、注意事项:
A、job必须通过bsub提交,不允许直接在ETX连接的login server执行;
B、数据目录: /networkpub/project/dt801/work/$vpn_username;
C、目录路径结构与线下服务器保持一致;
   工具: /network/tools
   库文件: /networkpub/project/dt801/library
   共享: /networkpub/project/dt801/share
"

echo "### ----- ----- Copy End ----- ----- ###"
