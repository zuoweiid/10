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
sed -i '/uci commit system/i\uci set system.@system[0].hostname='N1'' package/lean/default-settings/files/zzz-default-settings

# 固件版本_自定义署名：LEDE build $(TZ=UTC-8 date "+%Y.%m.%d") 显示范例： LEDE build 2021.02.08 @ 说明：【LEDE=作者 + build=建造 + （UTC-8=字符编码 + date=时间格式）】
sed -i "s/OpenWrt /LEDE build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改 Argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改wifi名称
sed -i 's/OpenWrt/N1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修复核心及添加温度显示
# sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
# sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# 增加带WiFi驱动，emmc写入和NTFS格式优盘挂载

# packages=" \
# brcmfmac-firmware-43430-sdio brcmfmac-firmware-43455-sdio kmod-brcmfmac wpad acl attr kmod-usb-hid kmod-mmc-spi \
# kmod-sdhci dumpe2fs e2freefrag f2fs-tools fuse-utils lsattr mkhfs nfs-utils nfs-utils-libs squashfs-tools-mksquashfs \
# squashfs-tools-unsquashfs swap-utils bash kmod-fs-ext4 kmod-fs-vfat kmod-fs-exfat dosfstools e2fsprogs ntfs-3g-utils \
# badblocks usbutils kmod-usb-ohci-pci kmod-usb-uhci kmod-usb2-pci kmod-usb3 kmod-usb-storage-extras kmod-usb-storage-uas \
# kmod-usb-net kmod-usb-net-asix-ax88179 kmod-usb-net-rtl8150 kmod-usb-net-rtl8152 autocore-arm \
# blkid lsblk parted fdisk cfdisk losetup tar gawk getopt perl perlbase-utf8 resize2fs tune2fs pv unzip \
# lscpu htop iperf3 curl lm-sensors install-program
# "
# sed -i '/FEATURES+=/ { s/cpiogz //; s/ext4 //; s/ramdisk //; s/squashfs //; }' \
    # target/linux/armvirt/Makefile
# for x in $packages; do
    # sed -i "/DEFAULT_PACKAGES/ s/$/ $x/" target/linux/armvirt/Makefile
# done


# rm -f package/lean/shadowsocksr-libev/patches/0002-Revert-verify_simple-and-auth_simple.patch
# sed -i '383,393 d' package/lean/shadowsocksr-libev/patches/0001-Add-ss-server-and-ss-check.patch
# sed -i 's/PKG_RELEASE:=5/PKG_RELEASE:=6/' package/lean/shadowsocksr-libev/Makefile
# sed -i '/PKG_SOURCE_VERSION:=/d' package/lean/shadowsocksr-libev/Makefile
# sed -i '/PKG_SOURCE_URL/a PKG_SOURCE_VERSION:=4799b312b8244ec067b8ae9ba4b85c877858976c' \
    # package/lean/shadowsocksr-libev/Makefile
