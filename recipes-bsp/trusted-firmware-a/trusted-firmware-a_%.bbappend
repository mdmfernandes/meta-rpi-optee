# Tell ATF that raspberrypi4-64-optee is a compatible machine
COMPATIBLE_MACHINE = "raspberrypi4-64-optee"

# coreutils-native is required for the "truncate" command
DEPENDS:append = " optee-os coreutils-native"

# Set compiler options
TFA_PLATFORM = "rpi4"
TFA_SPD = "opteed"
TFA_DEBUG = "1"
TFA_BUILD_TARGET = "bl31"

# Create the bl31 binary that will load OPTEE before the REE
# NOTE: RECIPE_SYSROOT points to the directory that holds all files populated from recipes specified in DEPENDS
do_deploy:append() {
    cp ${D}/firmware/bl31.bin ${WORKDIR}/bl31-pad.tmp
    truncate --size=128K ${WORKDIR}/bl31-pad.tmp
    # tee-pager_v2.bin is the OPTEE binary
    cat ${WORKDIR}/bl31-pad.tmp ${RECIPE_SYSROOT}/${nonarch_base_libdir}/firmware/tee-pager_v2.bin > ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/bl31-optee.bin
}

do_deploy[dirs] += "${DEPLOYDIR}/${BOOTFILES_DIR_NAME}"
