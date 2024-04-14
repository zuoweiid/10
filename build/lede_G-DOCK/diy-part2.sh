#!/bin/bash
#
# 说明：OpenWrt DIY脚本第2部分（更新提要之后）
# 如果额外添加的软件包与 Open­Wrt 源码中已有的软件包同名的情况，则需要把 Open­Wrt #源码中的同名软件包删除，否则会优先编译 Open­Wrt 中的软件包。这同样可以利用到的 DIY 脚本，相关指令应写在diy-part2.sh
#

# 修改默认IP：192.168.1.1
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate

# 设置密码为空（登陆时无需输入密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修改主机名：“OpenWrt_x86” 修改成你喜欢的就行（不能纯数字或者中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='G-DOCK'' package/lean/default-settings/files/zzz-default-settings

# 固件版本_自定义署名：LEDE build $(TZ=UTC-8 date "+%Y.%m.%d") 显示范例： LEDE build 2021.02.08 @ 说明：【LEDE=作者 + build=建造 + （UTC-8=字符编码 + date=时间格式）】
sed -i "s/OpenWrt /LEDE build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改 Argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改wifi名称
sed -i 's/OpenWrt/G-DOCK/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh