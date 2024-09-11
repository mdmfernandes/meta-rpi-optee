# This file has common changes for optee-os and optee-os-tadevkit, since both recipes use the same code
FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"

# 4.3.0
SRCREV = "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"

SRC_URI:append = " \
    file://0001-add-support-for-rpi4.patch \
"

# CFG_CORE_ARM64_PA_BITS: number of bits required to to initialize the largest physical address that we
#   need to map. 32 bits -> 4 GB, 33 bits -> 8 GB.
# CFG_DT: non-secure and secure devices trees can be accessed by OPTEE core to get some platform
#   configuration information.
EXTRA_OEMAKE += " \
    CFG_CORE_ARM64_PA_BITS=33 \
    CFG_DT=y \
"
