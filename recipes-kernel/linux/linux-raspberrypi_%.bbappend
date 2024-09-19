FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://kernel-optee.cfg \
    file://dto/optee-fix.dts \
"

# Add custom dts files to the kernel dts overlays source, for compiling them during do_compile
do_kernel_add_custom_overlays() {
 cp ${WORKDIR}/dto/optee-fix.dts ${S}/arch/arm64/boot/dts/overlays
}

addtask do_kernel_add_custom_overlays before do_compile after do_configure
