FILESEXTRAPATHS:prepend:raspberrypi4-64-optee := "${THISDIR}/files:"

SRC_URI:append:raspberrypi4-64-optee = " \
    file://kernel-optee.cfg \
    file://dto/optee-fix.dts \
"

# Add custom dts files to the kernel dts overlays source, for compiling them during do_compile
# NOTE: the overlay files must end with "-overlay.dts"
do_compile:prepend:raspberrypi4-64-optee() {
 cp ${WORKDIR}/sources/dto/optee-fix.dts ${S}/arch/arm64/boot/dts/overlays/optee-fix-overlay.dts
}
