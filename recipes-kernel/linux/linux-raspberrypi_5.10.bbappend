# In kernel 5.10 the overlays files must end with '-overlay.dts'
do_kernel_add_custom_overlays:append() {
    mv ${S}/arch/arm64/boot/dts/overlays/optee-fix.dts ${S}/arch/arm64/boot/dts/overlays/optee-fix-overlay.dts
}
