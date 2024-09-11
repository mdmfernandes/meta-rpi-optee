# This file has common changes for optee-os and optee-os-tadevkit, since both recipes use the same code
FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"

# 4.3.0
SRCREV = "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"

SRC_URI:append = " \
    file://0001-add-support-for-rpi4.patch \
"

EXTRA_OEMAKE += " \
    CFG_DT=y \
    CFG_CORE_ARM64_PA_BITS=33 \
"
