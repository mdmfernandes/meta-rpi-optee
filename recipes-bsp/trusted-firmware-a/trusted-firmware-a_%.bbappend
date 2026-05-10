# Tell ATF that raspberrypi4-64-optee is a compatible machine
COMPATIBLE_MACHINE:raspberrypi4-64-optee = "raspberrypi4-64-optee"

# coreutils-native is required for the "truncate" command
DEPENDS:append:raspberrypi4-64-optee = " optee-os coreutils-native"

# Set compiler options
TFA_PLATFORM:raspberrypi4-64-optee = "rpi4"
TFA_SPD:raspberrypi4-64-optee = "opteed"
TFA_DEBUG:raspberrypi4-64-optee = "1"
TFA_BUILD_TARGET:raspberrypi4-64-optee = "bl31"

# Create the bl31 binary that will load OPTEE before the REE
# NOTE: RECIPE_SYSROOT points to the directory that holds all files populated from recipes specified in DEPENDS
do_deploy:append:raspberrypi4-64-optee() {
    cp ${D}/firmware/bl31.bin ${WORKDIR}/bl31-pad.tmp
    truncate --size=128K ${WORKDIR}/bl31-pad.tmp
    # tee-pager_v2.bin is the OPTEE binary
    cat ${WORKDIR}/bl31-pad.tmp ${RECIPE_SYSROOT}/${nonarch_base_libdir}/firmware/tee-pager_v2.bin > ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/bl31-optee.bin
}

do_deploy[dirs] += "${DEPLOYDIR}/${BOOTFILES_DIR_NAME}"
