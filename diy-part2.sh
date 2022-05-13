#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Add HelloWorld & PassWall
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb package/custom/lua-maxminddb
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr package/custom/luci-app-vssr
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/custom/luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/custom/passwall

# Add OpenClash
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/custom/luci-app-openclash

# Add unblockneteasemusic
git clone --depth=1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/custom/luci-app-unblockneteasemusic

# Replace luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon feeds/luci/themes/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/custom/luci-app-argon-config

# Replace luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-dockerman
git clone --depth=1 https://github.com/lxl6125/luci-app-dockerman feeds/luci/applications/luci-app-dockerman

