#!/bin/bash


#---------------------------------------------------------------------------------------------------------------------------------------
./scripts/feeds clean                                                         # 清除编译临时文件
./scripts/feeds update -a                                                     # 更新插件源
#---------------------------------------------------------------------------------------------------------------------------------------


cd feeds/luci/applications           # 进入 LEDE源码内applications目录内；
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

cd ../                               # 退回至上级目录
cd themes                            # 进入themes主题目录

rm -rf luci-theme-argon              # 删除Argon主题（旧版必删）
rm -rf luci-theme-argon-mod          # 删除Argon主题
rm -rf luci-theme-design
rm -rf luci-theme-material
rm -rf luci-theme-netgear

cd ../
cd ../
cd ../                               # 退回至lede目录内；

#---------------------------------------------------------------------------------------------------------------------------------------
./scripts/feeds install -a             ##安装_插件源包
#---------------------------------------------------------------------------------------------------------------------------------------

git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/otherapp/luci-app-argon-config                 ##Argon主题设置
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/otherapp/luci-theme-argon                          ##Argon主题；匹配Lede源码
