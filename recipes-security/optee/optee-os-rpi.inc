# This file has common changes for optee-os and optee-os-tadevkit, since both recipes use the same code
FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"

# 3.19.0
SRCREV = "afacf356f9593a7f83cae9f96026824ec242ff52"

SRC_URI:append = " \
    file://0001-add-support-for-rpi4.patch \
"

# CFG_CORE_ARM64_PA_BITS: number of bits required to to initialize the largest physical address that we
#   need to map. 32 bits -> 4 GB, 33 bits -> 8 GB.
# CFG_DT: non-secure and secure devices trees can be accessed by OPTEE core to get some platform
#   configuration information. (e.g. ASLR seed)
# CFG_TEE_CORE_LOG_LEVEL: increase logging level to 'error + info + debug'
EXTRA_OEMAKE:append = " \
    CFG_CORE_ARM64_PA_BITS=33 \
    CFG_DT=y \
    CFG_TEE_CORE_LOG_LEVEL=3 \
"
