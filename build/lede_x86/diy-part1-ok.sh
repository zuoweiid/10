#!/bin/bash



# 取消-注释的源（如内置：ssr-plus）
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default                                         # 显示“helloworld”项目插件；含ssr-plus


# 添加-第三方源（添加至：feeds.conf.default文件内）插件在 openwrt/package/feeds 目录下；
# sed -i '$i '"src-git helloworld https://github.com/fw876/helloworld"'' feeds.conf.default    # 添加“helloworld”项目插件；含ssr-plus
# sed -i '$a src-git kenzok https://github.com/kenzok8/openwrt-packages' feeds.conf.default    # 常用插件源
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default                # 常用插件源_依赖安装
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default      # PPTP VPN 服务器等。。。
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default # 适合一键下载编译（smpackage目录）
# --------------------单独添加插件部分--------------------
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default          # 适合一键下载编译（smpackage目录）

./scripts/feeds clean                                                         # 清除编译临时文件
./scripts/feeds update -a                                                     # 更新插件源


#----------------------------------------------删除 LEDE源码内luci自带插件----------------------------------------------

cd feeds/luci/applications           # 进入 LEDE源码内applications目录内；
echo "***目录applications插件安装后路径：/lede源码/package/feeds/luci***"






# rm -rf luci-app-advanced-reboot
# rm -rf luci-app-aliyundrive-fuse
# rm -rf luci-app-aliyundrive-webdav
rm -rf luci-app-argon-config         # 删除luci-app-argon-config主题设置
# rm -rf luci-app-design-config
# rm -rf luci-app-dockerman
# rm -rf luci-app-easymesh
# rm -rf luci-app-eqos
# rm -rf luci-app-mosdns
rm -rf luci-app-unblockmusic       # 此插件包目前有效果，勿删除！！！（网易云解锁）
# rm -rf luci-app-ipsec-server       # lienol插件包内最新
# rm -rf luci-app-openvpn-server
rm -rf luci-app-serverchan           # 删除ServerChan微信推送
rm -rf luci-app-pushbot              # 删除PushBot 全能推送

cd ../                               # 退回至上级目录
cd themes                            # 进入themes主题目录

rm -rf luci-theme-argon              # 删除Argon主题（旧版必删）
rm -rf luci-theme-argon-mod          # 删除Argon主题
# rm -rf luci-theme-bootstrap
rm -rf luci-theme-design
rm -rf luci-theme-material
rm -rf luci-theme-netgear

cd ../
cd ../
cd ../                               # 退回至lede目录内；
#-----------------------------------------------------------------------------------------------------------------------

#----------------------------------------------删除 Kenzok目录内插件----------------------------------------------------

# cd feeds/kenzok                        # 进入 LEDE源码内kenzok目录内；
         
# rm -rf luci-app-argon-config
# rm -rf luci-app-argone-config
# rm -rf luci-app-unblockneteasemusic    # 删除网易云解锁
# rm -rf UnblockNeteaseMusic
# rm -rf luci-theme-argon
# rm -rf luci-theme-argone

# rm -rf luci-app-advanced
# rm -rf luci-app-aliyundrive-webdav
# rm -rf luci-app-design-config
# rm -rf luci-app-dockerman
# rm -rf luci-app-easymesh
# rm -rf luci-app-eqos
# rm -rf luci-app-mosdns
# cd ../ && cd ../ && cd ../            # 退回至lede目录内


# 删除lienol目录内插件
# luci-app-guest-wifi    # LEDE源码内最新
# luci-app-kodexplorer
# luci-app-pppoe-server
# luci-app-pptp-server
# luci-app-ramfree
# luci-app-socat
# luci-app-softethervpn
#-----------------------------------------------------------------------------------------------------------------------

#----------------------------------------------删除 smpackage目录内插件-------------------------------------------------

cd feeds/smpackage                      # 进入 LEDE源码内smpackage目录内；
echo "***目录smpackage插件安装后路径：/lede源码/package/feeds/smpackage***"

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
#-----------------------------------------------------------------------------------------------------------------------

./scripts/feeds install -a             ##安装_插件源包

# 下载第三方插件和主题
git clone  https://github.com/destan19/OpenAppFilter package/otherapp/OpenAppFilter         ##下载OpenAppFilter 应用访问过滤
git clone  https://github.com/zzsj0928/luci-app-pushbot package/otherapp/luci-app-pushbot   ##PushBot 全能推送，改名后
  


git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/otherapp/luci-app-argon-config                 ##Argon主题设置
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/otherapp/luci-theme-argon                          ##Argon主题；匹配Lede源码
git clone https://github.com/sbwml/luci-app-alist package/otherapp/luci-app-alist                                                ##alist网盘



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



