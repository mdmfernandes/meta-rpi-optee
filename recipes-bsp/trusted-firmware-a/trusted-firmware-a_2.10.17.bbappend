FILESEXTRAPATHS:prepend:raspberrypi4-64-optee := "${THISDIR}/files:"

SRC_URI:append:raspberrypi4-64-optee = " \
    file://0001-add-capability-to-load-bl32-from-0x20000.patch \
"
