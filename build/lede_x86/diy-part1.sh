#!/bin/bash



# 字体颜色配置
# print_error() {                           ## 打印红色字体
    # echo -e "\033[31m$1\033[0m"
# }

# print_green() {                           ## 打印绿色字体
    # echo -e "\033[32m$1\033[0m"
# }

# print_yellow() {                          ## 打印黄色字体
    # echo -e "\033[33m$1\033[0m"
# }


# 第三方插件源码
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default          # 适合一键下载编译（smpackage目录）

#---------------------------------------------------------------------------------------------------------------------------------------
./scripts/feeds clean                                                         # 清除编译临时文件
./scripts/feeds update -a                                                     # 更新插件源
#---------------------------------------------------------------------------------------------------------------------------------------



# if [ -d "feeds/luci/applications" ]; then   # 如果存在，就删除以下文件
	# # print_error "***删除冲突插件*** 路径：feeds/luci/applications "
	# cd feeds/luci/applications           # 进入 LEDE源码内applications目录内；
	# mkdir -p app && mv -f ./* app                   # 临时创建app文件夹，移动当前全部文件到app目录内，后续会删除；
	
	# # 移动保留的插件； mv -f app/插件名称 ./
	# mv -f app/luci-app-samba4 ./                    # 网络共享（必备插件）
	# mv -f app/luci-app-firewall ./                  # 防火墙（必备插件）
	
	# mv -f app/luci-app-autoreboot ./				# 计划定时重启（autopoweroff二选一）（常用）
	# mv -f app/luci-app-ddns ./						# 动态DNS（集成阿里DDNS客户端）（常用）
	# mv -f app/luci-app-filetransfer ./				# 文件传输（可web安装ipk包）（常用）
	# mv -f app/luci-app-netdata ./					# Netdata实时监控（CPU详情图表）
	# mv -f app/luci-app-nlbwmon ./					# 带宽监控（显示、配置、备份）（常用）
	# mv -f app/luci-app-ttyd ./						# 网页终端命令行（常用）
	# mv -f app/luci-app-unblockmusic ./				# 网易云解锁插件，目前有效 勿删除！！！（常用）
	# mv -f app/luci-app-vlmcsd ./					# KMS服务器设置（常用）
	# mv -f app/luci-app-webadmin ./					# Web管理页面设置；修改80默认端口（常用）
	# mv -f app/luci-app-zerotier ./					# ZeroTier内网穿透（常用）
	
	# rm -rf app                                      # 删除临时创建的app目录；
	# cd ../
	# cd themes
	
	# rm -rf luci-theme-argon              # 删除Argon主题（旧版必删）
	# rm -rf luci-theme-argon-mod          # 删除Argon主题
	# # rm -rf luci-theme-bootstrap
	# rm -rf luci-theme-design
	# rm -rf luci-theme-material
	# rm -rf luci-theme-netgear
# # else
	# # print_yellow "***目录不存在*** 路径：feeds/luci/applications "
# fi

# cd ../
# cd ../
# cd ../ 

#---------------------------------------------------------------------------------------------------------------------------------------
./scripts/feeds install -a                             ##安装_插件源包（安装后目录：lede源码/package/feeds/***）
#---------------------------------------------------------------------------------------------------------------------------------------


# 下载第三方插件和主题


# 升级 Go版本
# rm -rf feeds/packages/lang/golang && git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang

git clone --depth 1 https://github.com/zuoweiid/luci-app.git package/otherapp                                                    ## 下载自己整理的源码






#git clone https://github.com/thinktip/luci-theme-neobird.git package/otherapp/luci-theme-neobird                 ##主题



# git clone https://github.com/fangli/openwrt-vm-tools package/otherapp/open-vm-tools                                              ##open-vm-tools 工具；（Utilities--->>open-vm-tools   选择设置为 M 模块化功能）
# https://github.com/vernesong/OpenClash
#git clone  https://github.com/bigbugcc/OpenwrtApp package/otherapp/OpenwrtApp           ##作者的插件包
# vssr科学上网
#git clone https://github.com/jerrykuku/lua-maxminddb.git package/otherapp/lua-maxminddb
#git clone https://github.com/jerrykuku/luci-app-vssr.git package/otherapp/luci-app-vssr    ##VSSR科学上网（je大佬插件）







# ----------------------------------编译无效果插件------------------------------------------------------------
# git clone https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk.git package/otherapp/mentohust                                                ##校园网认证
# git clone -b master  https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/otherapp/luci-app-unblockneteasemusic   ##解锁网易云（可以编译但是插件无效）
# git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/otherapp/luci-app-unblockneteasemusic              ##解锁网易云(编译后,不显示插件)

# ------------------------------------------------------------------------------------------------------------



