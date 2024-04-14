#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001
# AutoBuild DiyScript

Diy_Core() {
	Author=Hyy2001   #作者名称,这个名称将在 OpenWrt 首页显示
	Default_Device=x86_64  #设备的官方名称,例如 [d-team_newifi-d2]、[x86_64]
	Short_Firmware_Date=true   #固件日期样式,当设置为 true: [20210420] false: [202104202359]
	Default_IP_Address=192.168.1.1   #固件后台 IP 地址,默认为 [192.168.1.1]

	INCLUDE_AutoUpdate=true   # 启用后,将自动添加 Scripts/AutoUpdate.sh 和 luci-app-autoupdate 到固件
	INCLUDE_AutoBuild_Tools=true   # 添加 Scripts/AutoBuild_Tools.sh 到固件
	INCLUDE_DRM_I915=true   # 自动启用 Intel Graphics 驱动 (测试特性)
	INCLUDE_Theme_Argon=true   # 自动添加适用于当前源码的 luci-theme-argon 主题
	INCLUDE_Obsolete_PKG_Compatible=false   # 优化原生 OpenWrt-19.07、21.02 支持 (测试特性)
}
# 注: 若要启用某项功能,请将相关的值修改为 true,禁用某项功能则修改为 false





Firmware-Diy() {
	Update_Makefile exfat $(PKG_Finder d package exfat)
	AddPackage svn ../feeds/packages/admin netdata https://github.com/openwrt/packages/trunk/admin

	case ${TARGET_PROFILE} in
	d-team_newifi-d2)
		Replace_File CustomFiles/mac80211.sh package/kernel/mac80211/files/lib/wifi
		Replace_File CustomFiles/system_d-team_newifi-d2 package/base-files/files/etc/config system
		# Replace_File CustomFiles/Patches/102-mt7621-fix-cpu-clk-add-clkdev.patch target/linux/ramips/patches-5.4
	;;
	esac
}
