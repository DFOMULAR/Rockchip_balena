include balena-image.inc

BALENA_BOOT_PARTITION_FILES_append_rockpi-4b-rk3399 = " \
    extlinux/extlinux.conf_flasher:/extlinux/extlinux.conf \
"

BALENA_BOOT_PARTITION_FILES_append_rock-4c-plus-rk3399 = " \
    extlinux/extlinux.conf_flasher:/extlinux/extlinux.conf \
"
