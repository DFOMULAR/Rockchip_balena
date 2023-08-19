# the bsp sets noexec on a bunch of tasks and we need to clear it to fix the following error:
#WARNING: u-boot-radxa-cm3-io-1.0-r0 do_package: Manifest /home/floion/builds/test/balena-rockpi/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-radxa-binary-loader.packagedata not found in radxa_cm3_io_rk3566 armv8a-crc armv8a aarch64 allarch x86_64_x86_64-nativesdk (variant '')?
#WARNING: balena-image-flasher-1.0-r0 do_rootfs: Manifest /home/floion/builds/test/balena-rockpi/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-radxa-binary-loader.package_write_ipk not found in radxa_cm3_io_rk3566 armv8a-crc armv8a aarch64 allarch x86_64_x86_64-nativesdk (variant '')?
#ERROR: balena-image-flasher-1.0-r0 do_rootfs: No manifest generated from: radxa-binary-loader in /home/floion/builds/test/balena-rockpi/build/../layers/meta-radxa/recipes-bsp/rk-binary/radxa-binary-loader_git.bb
FILESEXTRAPATHS:prepend = "${THISDIR}/files:"
#SRC_URI += "file://rk3399_miniloader_v1.26.bin"

SRCREV = "38ab40ee2b3cc3d5a4a4f9aee56cba37392ccc9e"
LOADER_rk3399 = "bin/rk33/rk3399_loader_v1.20.119.bin"
MINILOADER_rk3399 = "bin/rk33/rk3399_miniloader_v1.19.bin"
DDR_rk3399 = "bin/rk33/rk3399_ddr_800MHz_v1.25.bin"
BL31_rk3399 = "bin/rk33/rk3399_bl31_v1.35.elf"
BL32_rk3399 = "bin/rk33/rk3399_bl32_v1.24.bin"

python __anonymous() {
    d.delVarFlag('do_package', 'noexec')
    d.delVarFlag('do_packagedata', 'noexec')
    d.delVarFlag('do_package_write_ipk', 'noexec')
}
