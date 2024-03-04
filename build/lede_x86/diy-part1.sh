#!/bin/bash
#
# 说明：diy-part1.sh脚本第2部分（更新提要之后）
# 如果额外添加的软件包与 Open­Wrt 源码中已有的软件包同名的情况，则需要把 Open­Wrt #源码中的同名软件包删除，否则会优先编译 Open­Wrt 中的软件包。这同样可以利用到的 DIY 脚本，相关指令应写在diy-part2.sh
#

# 取消-注释的源（如内置：ssr-plus）
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default                                         # 显示“helloworld”项目插件；含ssr-plus


# 添加-第三方源（添加至：feeds.conf.default文件内）插件在 openwrt/package/feeds 目录下；
sed -i '$i '"src-git helloworld https://github.com/fw876/helloworld"'' feeds.conf.default    # 添加“helloworld”项目插件；含ssr-plus
sed -i '$a src-git kenzok https://github.com/kenzok8/openwrt-packages' feeds.conf.default    # 常用插件源
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default                # 常用插件源_依赖安装
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default      # PPTP VPN 服务器等。。。

# --------------------单独添加插件部分--------------------