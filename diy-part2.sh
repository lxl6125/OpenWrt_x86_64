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

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon-mod/g' feeds/luci/collections/luci/Makefile

# Add kernel build user
sed -i '/CONFIG_KERNEL_BUILD_USER/d' .config &&
    echo 'CONFIG_KERNEL_BUILD_USER="lxl6125"' >>.config

# Add kernel build domain
sed -i '/CONFIG_KERNEL_BUILD_DOMAIN/d' .config &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config

# Add PassWall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/custom/passwall
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/custom/luci-app-passwall

# Add OpenClash
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/custom/luci-app-openclash

# Add unblockneteasemusic
git clone --depth=1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/custom/luci-app-unblockneteasemusic

# Replace luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-dockerman
git clone --depth=1 https://github.com/lxl6125/luci-app-dockerman feeds/luci/applications/luci-app-dockerman

# Add luci-app-argon-config
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/custom/luci-app-argon-config

# Preset clash core
$GITHUB_WORKSPACE/preset-clash-core.sh amd64

