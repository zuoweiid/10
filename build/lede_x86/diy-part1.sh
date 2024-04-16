#!/bin/bash
lede_path="${PWD}"     ##目录变量=Lede源码目录；
# lede_path=$(cd `dirname $0`; pwd)     ##目录变量=Lede源码目录；
cd $lede_path

# 字体颜色配置
print_error() {                           ## 打印红色字体
    echo -e "\033[31m$1\033[0m"
}

print_green() {                           ## 打印绿色字体
    echo -e "\033[32m$1\033[0m"
}

print_yellow() {                          ## 打印黄色字体
    echo -e "\033[33m$1\033[0m"
}

#---------------------------------------------------------------------------------------------------------------------------------------
./scripts/feeds clean                                                         # 清除编译临时文件
./scripts/feeds update -a                                                     # 更新插件源
#---------------------------------------------------------------------------------------------------------------------------------------

cd $lede_path   #---删除 LEDE源码内 luci/applications 自带插件
if [ -d "$lede_path/feeds/luci/applications" ]; then   # 如果存在，就删除以下文件
	print_error "***删除冲突插件*** 路径：feeds/luci/applications "
	mkdir -p app && mv -f ./* app                   # 临时创建app文件夹，移动当前全部文件到app目录内，后续会删除；
	
	mv -f app/luci-app-samba4 ./                    # 网络共享（必备插件）
	mv -f app/luci-app-firewall ./                  # 防火墙（必备插件）
	
	mv -f app/luci-app-autoreboot ./				# 计划定时重启（autopoweroff二选一）（常用）
	mv -f app/luci-app-ddns ./						# 动态DNS（集成阿里DDNS客户端）（常用）
	mv -f app/luci-app-filetransfer ./				# 文件传输（可web安装ipk包）（常用）
	mv -f app/luci-app-netdata ./					# Netdata实时监控（CPU详情图表）
	mv -f app/luci-app-nlbwmon ./					# 带宽监控（显示、配置、备份）（常用）
	mv -f app/luci-app-ttyd ./						# 网页终端命令行（常用）
	mv -f app/luci-app-unblockmusic ./				# 网易云解锁插件，目前有效 勿删除！！！（常用）
	mv -f app/luci-app-vlmcsd ./					# KMS服务器设置（常用）
	mv -f app/luci-app-webadmin ./					# Web管理页面设置；修改80默认端口（常用）
	mv -f app/luci-app-zerotier ./					# ZeroTier内网穿透（常用）
	
	rm -rf app                                      # 删除临时创建的app目录；
	cd $lede_path/feeds/luci/themes      # 进入themes主题目录

	rm -rf luci-theme-argon              # 删除Argon主题（旧版必删）
	rm -rf luci-theme-argon-mod          # 删除Argon主题
	# rm -rf luci-theme-bootstrap
	rm -rf luci-theme-design
	rm -rf luci-theme-material
	rm -rf luci-theme-netgear
else
	print_yellow "***目录不存在*** 路径：feeds/luci/applications "
fi
	

#---------------------------------------------------------------------------------------------------------------------------------------
cd $lede_path
./scripts/feeds install -a             ##安装_插件源包
#---------------------------------------------------------------------------------------------------------------------------------------

git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/otherapp/luci-app-argon-config                 ##Argon主题设置
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/otherapp/luci-theme-argon                          ##Argon主题；匹配Lede源码





