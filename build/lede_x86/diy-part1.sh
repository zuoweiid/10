#!/bin/bash

sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default          # 适合一键下载编译（smpackage目录）

./scripts/feeds clean                                                         # 清除编译临时文件
./scripts/feeds update -a                                                     # 更新插件源

cd feeds/luci/applications           # 进入 LEDE源码内applications目录内；
rm -rf luci-app-argon-config         # 删除luci-app-argon-config主题设置
rm -rf luci-app-unblockmusic       # 此插件包目前有效果，勿删除！！！（网易云解锁）
rm -rf luci-app-serverchan           # 删除ServerChan微信推送
rm -rf luci-app-pushbot              # 删除PushBot 全能推送

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

cd feeds/smpackage                      # 进入 LEDE源码内smpackage目录内；
rm -rf luci-app-argon-config
rm -rf luci-app-argone-config
rm -rf luci-app-pushbot
rm -rf oaf                              # 删除OpenAppFilter 应用访问过滤

rm -rf luci-app-unblockneteasemusic     # 删除网易云解锁
rm -rf UnblockNeteaseMusic
rm -rf UnblockNeteaseMusic-Go

rm -rf luci-theme-argon
rm -rf luci-theme-argone
rm -rf luci-theme-atmaterial_new
rm -rf luci-theme-design
rm -rf luci-theme-edge
rm -rf luci-theme-ifit
rm -rf luci-theme-kucat
rm -rf luci-theme-opentopd
rm -rf luci-theme-tomato
cd ../
cd ../                                 # 退回至lede目录内

./scripts/feeds install -a             ##安装_插件源包


git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/otherapp/luci-app-argon-config                 ##Argon主题设置
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/otherapp/luci-theme-argon                          ##Argon主题；匹配Lede源码
