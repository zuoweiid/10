#!/bin/bash
#
# 说明：diy-part1.sh脚本第1部分（更新提要之后）
# 如果额外添加的软件包与 Open­Wrt 源码中已有的软件包同名的情况，则需要把 Open­Wrt #源码中的同名软件包删除，否则会优先编译 Open­Wrt 中的软件包。这同样可以利用到的 DIY 脚本，相关指令应写在diy-part2.sh
#

# --------------------单独添加插件部分--------------------
https://github.com/garypang13/openwrt-packages  未测试
# --------------------01.25更新后的源-----------------------

sed -i '$i '"src-git passwall https://github.com/xiaorouji/openwrt-passwall"'' feeds.conf.default   # passwall
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default       # passwall

sed -i '$i '"src-git OpenClash https://github.com/vernesong/OpenClash"'' feeds.conf.default         # OpenClash
sed -i '$i '"src-git jerrykuku https://github.com/jerrykuku/luci-app-vssr"'' feeds.conf.default     # vssr
git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash                      # clash

git clone https://github.com/AdguardTeam/AdGuardHome.git package/AdGuardHome                        # AdGuardHome去广告
git clone https://github.com/rufengsuixing/luci-app-adguardhome                                     # AdGuardHome去广告_本机下载

git clone https://github.com/rufengsuixing/luci-app-onliner.git package/luci-app-onliner           # nlbwmon 网络带宽监视器  需要luci-app-nlbwmon
# --------------------↓备用添加部分↓--------------------

# 添加 gotop 活动监视器（第一个不维护了）
#git clone https://github.com/cjbassi/gotop.git package/gotop
#git clone https://github.com/xxxserxxx/gotop.git package/gotop

# 添加 diskman 磁盘分区
#git clone https://github.com/lisaac/luci-app-diskman.git package/luci-app-diskman

# 添加 subconverter 订阅转换
#git clone https://github.com/tindy2013/openwrt-subconverter.git package/openwrt-subconverter

# 添加OpenWRT的自动核心
#git clone https://github.com/project-openwrt/openwrt.git package/luci-app-diskman

# --------------------单独添加主题部分--------------------

# 清除旧版argon主题并拉取最新版
#pushd ../package/lean
#rm -rf luci-theme-argon
#git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon


# ----------------------我是分界线------------------------
# --------------------以下是非必须部分--------------------
lede跟Lienol源码增加luci-app-bypass的话，把以下代码放入diy-1.sh里面就行
git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass
svn co https://github.com/garypang13/openwrt-packages/trunk/lua-maxminddb
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}

Project源码增加luci-app-bypass的话，把以下代码放入diy-1.sh里面就行
git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass
svn co https://github.com/garypang13/openwrt-packages/trunk/lua-maxminddb

CONFIG_PACKAGE_luci-app-uugamebooster=y            # 前面加“#”注释掉
CONFIG_PACKAGE_luci-app-uugamebooster is not set   # 或者后面加“ is not set”
