# Copyright (C) 2021, Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

require recipes-kernel/linux/linux-yocto.inc
require linux-rockchip.inc

#inherit freeze-rev local-git

#SRCREV = "72de5a560a44fb81549f1da325a1b3e323a7aaf7"
#git://github.com/JeffyCN/mirrors.git;protocol=https;nobranch=1;branch=kernel-5.10-2022_01_10; 
SRC_URI = " \
	git://github.com/radxa/kernel.git;protocol=https;branch=linux-5.10-gen-rkr4.1; \
        file://brcmfmac.scc \
	file://${THISDIR}/files/cgroups.cfg \
        file://hw_intfc.conf \
"
SRCREV = "89768365752e5c97e59ee7779f908489670269f2"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

KERNEL_VERSION_SANITY_SKIP = "1"
LINUX_VERSION ?= "5.10"

SRC_URI:append = " ${@bb.utils.contains('IMAGE_FSTYPES', 'ext4', \
		   'file://${THISDIR}/files/ext4.cfg', \
		   '', \
		   d)}"

BALENA_CONFIGS_append_rock-4c-plus-rk3399 = " backported-brcmfmac clk-regmap"
#BALENA_CONFIGS_append = " clk-regmap"

BALENA_CONFIGS[clk-regmap] += " \
    CONFIG_COMMON_CLK_ROCKCHIP_REGMAP=y \
    CONFIG_ARCH_SUNXI=n \ 
    CONFIG_BRCMFMAC=n \
    CONFIG_BRCMUTIL=n \
    CONFIG_ROCKCHIP_DW_HDMI=n \
"

